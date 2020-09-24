package com.visualpathit.account.model;

import javax.persistence.*;
import java.util.Set;
@Entity
@Table(name = "role")
public class Role {
	/** the id field !*/
    private Long id;
    /** the name field !*/
    private String name;
    /** the user field !*/
    private Set<User> users;
    /** {@inheritDoc}} !*/
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    /**
     * {@link Role#id}
     !*/
    public Long getId() {
        return id;
    }
    /** {@inheritDoc}} !*/
    public final void setId(final Long id) {
        this.id = id;
    }
    /**
     * {@link Role#name}
     !*/
    public String getName() {
        return name;
    }
    /** {@inheritDoc}} !*/
    public final void setName(final String name) {
        this.name = name;
    }
    /**
     * {@inheritDoc}} 
     !*/
    @ManyToMany(mappedBy = "roles")
    /**
     * {@link Role#id}
     !*/
    public Set<User> getUsers() {
        return users;
    }
    /**
     * {@inheritDoc}} 
     !*/
    public final void setUsers(Set<User> users) {
        this.users = users;
    }
}
