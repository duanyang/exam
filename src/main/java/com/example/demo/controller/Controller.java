package com.example.demo.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.codec.digest.DigestUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.model.Answer;
import com.example.demo.model.Course;
import com.example.demo.model.Exam;
import com.example.demo.model.Question;
import com.example.demo.model.Score;
import com.example.demo.model.User;
import com.example.demo.repository.CourseRepository;
import com.example.demo.repository.ExamRepository;
import com.example.demo.repository.QuestionRepository;
import com.example.demo.repository.ScoreRepository;
import com.example.demo.repository.UserRepository;

@RestController
@RequestMapping("/onlineexam")
public class Controller {

	@Autowired
	UserRepository userRepository;

	@Autowired
	CourseRepository courseRepository;

	@Autowired
	ExamRepository examRepository;
	
	@Autowired
	QuestionRepository questionRepository;
	
	@Autowired
	ScoreRepository scoreRepository;

	@GetMapping("/home")
	public ModelAndView home() {
		return new ModelAndView("home");
	}

	@PostMapping("/login")
	public ModelAndView login(HttpServletRequest request) {
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		User user = userRepository.login(username, DigestUtils.md5Hex(password));
		if (user != null) {
			request.getSession().setAttribute("userid", user.getId());
			if (user.getRole().equals("student")) {
				List<Course> courses = courseRepository.findAll();
				return new ModelAndView("listCourse", "courses", courses);
			}
			else {
				return new ModelAndView("adminMenu");
			}

		} else {
			return new ModelAndView("home");
		}
	}

	@GetMapping("/register")
	public ModelAndView register() {
		return new ModelAndView("register");
	}

	@PostMapping("/processRegister")
	public ModelAndView processRegister(HttpServletRequest request) {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		String username = request.getParameter("username");
		String password = request.getParameter("psw");
		User user = new User(name, email, username, DigestUtils.md5Hex(password), "student");
		userRepository.save(user);
		return new ModelAndView("home");
	}

	@GetMapping("/getExams")
	public ModelAndView getExam(@RequestParam("id") String id) {
		Course course = courseRepository.findOne(Integer.parseInt(id));
		Set<Exam> exams = course.getExams();
		return new ModelAndView("exam", "exams", exams);
	}

	@GetMapping("/getQuestion")
	public ModelAndView getQuestion(HttpServletRequest request) {
		Exam exam = examRepository.findOne(Integer.parseInt(request.getParameter("id")));
		Set<Question> questions = exam.getQuestions();
		ModelAndView model = new ModelAndView("question");
		request.getSession().setAttribute("questions", questions);
		model.addObject("questions", questions);
		return model;
	}
	
	@GetMapping("/addQuestion")
	public ModelAndView addQuestion(){
		List<Exam>exams=examRepository.findAll();
		return new ModelAndView("addQuestion", "exams", exams);
	}
	
	@PostMapping("/processAddQuestion")
	public ModelAndView processAddQuestion(HttpServletRequest request, @RequestParam("file") MultipartFile file){
		String questionContent=request.getParameter("question");
		Answer one=new Answer(request.getParameter("answer1"));
		Answer two=new Answer(request.getParameter("answer2"));
		Answer three=new Answer(request.getParameter("answer3"));
		Answer four=new Answer(request.getParameter("answer4"));
		String examid=request.getParameter("examid");
		String correct=request.getParameter("correct");
		int totalPoint= Integer.parseInt(request.getParameter("totalpoint"));
		final String root="C:/Users/xingh/Documents/workspace-sts-3.8.4.RELEASE/Exam/src/main/resources/static/img";
		if(!file.isEmpty()){
			try {
				byte[] bytes=file.getBytes();
				BufferedOutputStream stream=new BufferedOutputStream(new FileOutputStream(new File(root+"/"+file.getOriginalFilename())));
				stream.write(bytes);
				stream.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		Exam exam=examRepository.getOne(Integer.parseInt(examid));
		Question question=new Question(questionContent, totalPoint);
		Set<Answer> answers=new HashSet<Answer>();
		answers.add(one);
		answers.add(two);
		answers.add(three);
		answers.add(four);
		question.setAnswers(answers);
		question.setCorrectAnswer(correct);
		question.setExam(exam);
		if(!file.isEmpty()){
		question.setPiturePath(file.getOriginalFilename());
		}
		one.setQuestion(question);
		two.setQuestion(question);
		three.setQuestion(question);
		four.setQuestion(question);
		questionRepository.save(question);
		return new ModelAndView("adminMenu");	
	}
	
	@PostMapping("/calculateScores")
	public ModelAndView caluclateScore(HttpServletRequest request){
		int totalScore=0;
		int userScore=0;
		Set<Question> questions=(Set<Question>) request.getSession().getAttribute("questions");
		for(Question question: questions){
			String answer=request.getParameter(question.getId().toString());
			totalScore+=question.getScore();
			if(answer.equals(question.getCorrectAnswer())){
				userScore+=question.getScore();
			}
			else{
				userScore+=question.getScore()*0.2;
			}
		}
		Score score=new Score(userScore, totalScore);
		Exam exam=questions.iterator().next().getExam();
		int userId=(Integer)request.getSession().getAttribute("userid");
		score.setExam(exam);
		score.setUser(userRepository.findOne(userId));
		scoreRepository.save(score);
		ModelAndView model=new ModelAndView("showScore");
		model.addObject("score", userScore);
		model.addObject("totalScore", totalScore);
		model.addObject("exam", exam.getTitle());
		return model;
	}
	
	@GetMapping("/logout")
	public ModelAndView logout(HttpServletRequest request){
		request.getSession().removeAttribute("userid");
		if(request.getSession().getAttribute("questions")!=null)
			request.getSession().removeAttribute("questions");
		request.getSession().invalidate();
		return new ModelAndView("home");
	}
	
	@GetMapping("/getExam")
	public ModelAndView getExams(){
		List<Exam> exams = examRepository.findAll();
		return new ModelAndView("selectExam", "exams", exams);
	}
	
	@GetMapping("/getScore")
	public ModelAndView getScore(@RequestParam("id") String id){
		Exam exam=examRepository.findOne(Integer.parseInt(id));
		List<Score> scores=scoreRepository.findScore(exam);
		return new ModelAndView("listScore", "scores", scores);
	}
	
	@GetMapping("/addExam")
	public ModelAndView addExam(){
		List<Course>courses=courseRepository.findAll();
		return new ModelAndView("addExam", "courses", courses);
	}
	
	@PostMapping("/processAddExam")
	public ModelAndView processAddScore(HttpServletRequest request){
		String id=request.getParameter("courseid");
		String title=request.getParameter("title");
		Course course=courseRepository.getOne(Integer.parseInt(id));
		Exam exam=new Exam(title);
		exam.setCourse(course);
		course.getExams().add(exam);
		courseRepository.save(course);
		return new ModelAndView("adminMenu");
	}
}
