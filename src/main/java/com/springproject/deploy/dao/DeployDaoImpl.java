package com.springproject.deploy.dao;

import java.util.ArrayList;
import java.util.List;


import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.jta.UserTransactionAdapter;

import com.springproject.chain.dto.ChainTableDto;
import com.springproject.deploy.dto.DeployDto;
import com.springproject.employee.dto.EmployeeDto;
import com.springproject.program.dto.ProgramTableDto;
import com.springproject.wprogramtable.dto.WProgramTableDto;

@Repository
public class DeployDaoImpl extends SqlSessionDaoSupport implements DeployDao{

	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	@Override
	public int insertOneDeployDao(DeployDto deployDto) {
		return getSqlSession().insert("DeployDao.insertOneDeployDao", deployDto);
	}
	
	@Override
	public int insertOneWProgram(WProgramTableDto wProgramTableDto){
		System.out.println(wProgramTableDto.getwProNo_pageId()+"/"+wProgramTableDto.getwProNo_deployNo());
		return getSqlSession().insert("DeployDao.insertOneWProgram",wProgramTableDto);
	}

	@Override
	public List<DeployDto> selectAllDeployDao() {
		return getSqlSession().selectList("DeployDao.selectAllDeployDao");
	}

	@Override
	public DeployDto selectOneDeployDao(int deployNo) {
		return getSqlSession().selectOne("DeployDao.selectOneDeployDao", deployNo);
	}

	@Override
	public int updateOneDeployDao(DeployDto deployDto) {
		return getSqlSession().update("DeployDao.updateOneDeployDao", deployDto);
	}

	@Override
	public int deleteOneDeployDao(int deployNo) {
		return getSqlSession().delete("DeployDao.deleteOneDeployDao", deployNo);
	}

	@Override
	public List<EmployeeDto> selectSomeDeployDao(EmployeeDto employeeDto) {
		return getSqlSession().selectList("DeployDao.selectSomeDeployDao", employeeDto);
	}

   @Override
   public List<ChainTableDto> selectSomeChainDao(ChainTableDto chainTableDto) {
      return getSqlSession().selectList("DeployDao.selectSomeChainDao",chainTableDto);
   }

   @Override
   public List<ProgramTableDto> selectSomeProgramDao(ProgramTableDto programTableDto) {
      return getSqlSession().selectList("DeployDao.selectSomeProgramDao",programTableDto);
   }

	@Override
	public List<ChainTableDto> selectAllChainDao() {
		return getSqlSession().selectList("DeployDao.selectAllChainDao");
	}

	@Override
	public List<ProgramTableDto> selectAllProgramDao(String paramChainId) {
		return getSqlSession().selectList("DeployDao.selectAllProgramDao",paramChainId);
	}

	@Override
	public int selectMaxDeployNo() {
		return getSqlSession().selectOne("DeployDao.selectMaxDeployNo");
	}

	@Override
	public List<WProgramTableDto> selectAllWProgramDao(int deployNo) {
		return getSqlSession().selectList("DeployDao.selectAllWProgramDao",deployNo);
	}

}
