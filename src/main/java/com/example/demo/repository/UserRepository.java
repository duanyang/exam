package com.example.demo.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.model.User;


@Repository
public interface UserRepository extends JpaRepository<User, Integer>{
	
	@Transactional
	@Query ("select u from User u where u.username= :uname and u.password= :pass")
	public User login(@Param("uname") String uname, @Param("pass") String pass);
}
