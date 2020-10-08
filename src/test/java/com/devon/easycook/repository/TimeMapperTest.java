package com.devon.easycook.repository;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.devon.easycook.config.RootConfig;
import com.devon.easycook.config.ServletConfig;
import com.devon.easycook.mapper.TimeMapper;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {RootConfig.class, ServletConfig.class})
@Log4j
public class TimeMapperTest {
	@Setter(onMethod = @__({@Autowired}))
	private TimeMapper timeMapper;
	@Test
	public void testGetTime() {
		log.info(timeMapper.getClass().getName());
		log.info(timeMapper.getTime());
	}
	public void testGetTime2() {
		log.info(timeMapper.getClass().getName());
		log.info(timeMapper.getTime2());
	}
}
