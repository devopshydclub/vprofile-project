package com.visualpathit.account.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.visualpathit.account.model.Role;

public interface RoleRepository extends JpaRepository<Role, Long>{
}
