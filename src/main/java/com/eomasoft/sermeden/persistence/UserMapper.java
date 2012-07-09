package com.eomasoft.sermeden.persistence;

import com.eomasoft.sermeden.domain.User;

public interface UserMapper {
	
	User findByUsername(String username);

}
