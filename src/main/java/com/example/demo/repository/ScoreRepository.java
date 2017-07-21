package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.model.Exam;
import com.example.demo.model.Score;

@Repository
public interface ScoreRepository extends JpaRepository<Score, Integer>{
	
	@Transactional
	@Query("select c from Score c where c.exam= :exam")
	List<Score> findScore(@Param("exam") Exam exam);

}
