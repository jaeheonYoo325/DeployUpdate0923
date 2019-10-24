package com.springproject.deploy.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.jta.UserTransactionAdapter;

import com.springproject.chain.dto.ChainDto;
import com.springproject.deploy.dto.CategoryTypeDto;
import com.springproject.deploy.dto.DeployPayDto;
import com.springproject.deploy.dto.DeployRequestDto;
import com.springproject.employee.dto.EmployeeDto;
import com.springproject.mastercode.dto.MasterCodeDto;
import com.springproject.modifiedprograms.dto.ModifiedProgramsDto;
import com.springproject.modifiedresources.dto.ModifiedResourcesDto;
import com.springproject.program.dto.ProgramDto;

@Repository
public class DeployDaoImpl extends SqlSessionDaoSupport implements DeployDao {

	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	@Override
	public int InsertDeployRequestDao(DeployRequestDto deployDto) {
		return getSqlSession().insert("DeployDao.InsertDeployRequestDao", deployDto);
	}

	@Override
	public int insertModifiedProgramDao(ModifiedProgramsDto modifiedProgramsDto) {
		return getSqlSession().insert("DeployDao.insertModifiedProgramDao", modifiedProgramsDto);
	}

	@Override
	public List<DeployRequestDto> selectAllDeployRequestDao() {
		return getSqlSession().selectList("DeployDao.selectAllDeployRequestDao");
	}

	@Override
	public DeployRequestDto selectDeployRequestOfDeployNoDao(Long deployNo) {
		return getSqlSession().selectOne("DeployDao.selectDeployRequestOfDeployNoDao", deployNo);
	}

	@Override
	public int updateOneDeployRequestDao(DeployRequestDto deployRequestDto) {
		return getSqlSession().update("DeployDao.updateOneDeployRequestDao", deployRequestDto);
	}

	@Override
	public int deleteOneDeployRequestOfDeployNoDao(Long deployNo) {
		return getSqlSession().delete("DeployDao.deleteOneDeployRequestOfDeployNoDao", deployNo);
	}

	@Override
	public List<EmployeeDto> selectSearchEmployeesDao(EmployeeDto employeeDto) {
		return getSqlSession().selectList("DeployDao.selectSearchEmployeesDao", employeeDto);
	}

	@Override
	public List<ChainDto> selectSearchedChainDao(ChainDto chainDto) {
		return getSqlSession().selectList("DeployDao.selectSearchedChainDao", chainDto);
	}

	@Override
	public List<ProgramDto> selectSearchedModifiedProgramDao(ProgramDto programDto) {
		return getSqlSession().selectList("DeployDao.selectSearchedModifiedProgramDao", programDto);
	}

	@Override
	public List<ChainDto> selectSearchAllChainDao() {
		return getSqlSession().selectList("DeployDao.selectSearchAllChainDao");
	}

	@Override
	public List<ProgramDto> selectSearchAllModifiedProgramDao(String selectedchainId) {
		return getSqlSession().selectList("DeployDao.selectSearchAllModifiedProgramDao", selectedchainId);
	}

	@Override
	public Long selectMaxDeployNo() {
		return getSqlSession().selectOne("DeployDao.selectMaxDeployNo");
	}

	@Override
	public List<ModifiedProgramsDto> selectModifiedProgramOfDeploNoDao(Long deployNo) {
		return getSqlSession().selectList("DeployDao.selectModifiedProgramOfDeploNoDao", deployNo);
	}

	@Override
	public int insertModifiedResourceDao(ModifiedResourcesDto modifiedResourcesDto) {
		return getSqlSession().insert("DeployDao.insertModifiedResourceDao", modifiedResourcesDto);
	}

	@Override
	public List<ModifiedResourcesDto> selectModifiedResourceOfDeploNoDao(Long deployNo) {
		return getSqlSession().selectList("DeployDao.selectModifiedResourceOfDeploNoDao", deployNo);
	}

	@Override
	public int deleteModifiedProgramOfDeployNoDao(Long deployNo) {
		return getSqlSession().delete("DeployDao.deleteModifiedProgramOfDeployNoDao", deployNo);
	}

	@Override
	public int deleteModifiedResourceOfDeployNoDao(Long deployNo) {
		return getSqlSession().delete("DeployDao.deleteModifiedResourceOfDeployNoDao", deployNo);
	}

	@Override
	public List<DeployRequestDto> selectCategoryDeployRequestDao(CategoryTypeDto deployCateListForDao) {
		return getSqlSession().selectList("DeployDao.selectCategoryDeployRequestDao", deployCateListForDao);
	}

	@Override
	public List<MasterCodeDto> selectAllMasterTableByStatusDao() {
		return getSqlSession().selectList("DeployDao.selectAllMasterTableByStatusDao");
	}

//	@Override
//	public List<MasterCodeDto> selectMasterCodeTypeDao() {
//		 return getSqlSession().selectList("DeployDao.selectMasterCodeTypeDao");
//	}

	@Override
	public List<MasterCodeDto> selectCategoryMasterCodesDao(String codeType) {
		return getSqlSession().selectList("DeployDao.selectCategoryMasterCodesDao", codeType);
	}

	@Override
	public int insertDeployPayForDeployRequestDao(DeployPayDto deployPayDto) {
		return getSqlSession().insert("DeployDao.insertDeployPayForDeployRequestDao",deployPayDto);
	}

	@Override
	public List<MasterCodeDto> selectMasterCodeOfCategoryDao() {
		return getSqlSession().selectList("DeployDao.selectMasterCodeOfCategoryDao");	
		}

	@Override
	public List<MasterCodeDto> selectMasterCodeOfSearchTypeDao(String searchTypeString) {
		return getSqlSession().selectList("DeployDao.selectMasterCodeOfSearchTypeDao", searchTypeString);
	}

	@Override
	public List<EmployeeDto> selectSearchAllEmployeesDao() {
		return getSqlSession().selectList("DeployDao.selectSearchAllEmployeesDao");

	}

}
