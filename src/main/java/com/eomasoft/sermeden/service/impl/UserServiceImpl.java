package com.eomasoft.sermeden.service.impl;

import javax.inject.Inject;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.eomasoft.sermeden.domain.User;
import com.eomasoft.sermeden.persistence.UserMapper;
import com.eomasoft.sermeden.service.UserService;

public class UserServiceImpl implements UserService {
	
	private UserMapper userMapper;

	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {

		User user = userMapper.findByUsername(username);
		if (user == null) {
			throw new UsernameNotFoundException("Username doesn't exists");
		}
		
		return user;
	}

	@Inject
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}

}
