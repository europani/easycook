package com.devon.easycook.repository;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.devon.easycook.config.RootConfig;
import com.devon.easycook.config.ServletConfig;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@WebAppConfiguration
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class})
@Log4j
public class DataSourceTest {
	@Setter(onMethod = @__({@Autowired}))
	private DataSource dataSource;
	
	@Setter(onMethod = @__({@Autowired}))
	private SqlSessionFactory sqlSessionFactory;
	
	@Test
	public void testConnection() {
		try {
			SqlSession session = sqlSessionFactory.openSession();
			Connection conn = dataSource.getConnection();
			log.info(session);
			log.info(conn);
		} catch (SQLException e) {
			fail(e.getMessage());
		}
	}
}
