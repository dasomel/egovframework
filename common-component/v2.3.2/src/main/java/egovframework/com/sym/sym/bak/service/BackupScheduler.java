package egovframework.com.sym.sym.bak.service;

import java.util.List;

import org.apache.log4j.Logger;
import org.quartz.CronTrigger;
import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerException;
import org.quartz.SchedulerFactory;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;

/**
 * Quartz Scheduler를 실행하는 스케줄러 클래스를 정의한다.
 * 
 * @author 김진만
 * @see
 * <pre>
 * == 개정이력(Modification Information) ==
 * 
 *   수정일       수정자           수정내용
 *  -------     --------    ---------------------------
 *  2010.09.06   김진만     최초 생성
 * </pre>
 */

public class BackupScheduler {

	/**
	 * egovBackupOpertService
	 */
	private EgovBackupOpertService egovBackupOpertService;

    /** ID Generation */    
	private EgovIdGnrService idgenService;
	
	/**
	 * Quartz 스케줄러
	 */
	private Scheduler sched;
	/**
	 * logger
	 */    
    private final Logger log = Logger.getLogger(this.getClass());	

	// 실행 대상을 읽기위한 페이지 크기 
	private static final int RECORD_COUNT_PER_PAGE = 10000;

	/**
	 * 백업스케줄러에 backupOpert 파라미터를 이용하여 Job , Trigger를 Add 한다.
	 * 
	 * @param backupOpert  백업스케줄러에 등록할 백업작업정보
	 * @exception Exception Exception
	 */
	public void insertBackupOpert(BackupOpert backupOpert) throws Exception {
		log.debug("백업스케줄을 등록합니다. 백업작업ID : " + backupOpert.getBackupOpertId() );
		// Job 만들기 
		JobDetail jobDetail = new JobDetail();
		jobDetail.setName(backupOpert.getBackupOpertId());
		jobDetail.setJobClass(BackupJob.class);
		// Trigger 만들기 
		//Trigger trigger = TriggerUtils.makeImmediateTrigger(backupOpert.getBackupOpertId(), 1, 1000000);
		CronTrigger trigger = new CronTrigger(backupOpert.getBackupOpertId(), null, backupOpert.toCronExpression());
		log.debug(backupOpert.getBackupOpertId() + " - cronexpression : " + trigger.getCronExpression());
		trigger.setJobName(jobDetail.getName());
		jobDetail.addJobListener(BackupJobListener.class.getName());
		
		// 데이터 전달 
		jobDetail.getJobDataMap().put("backupOpertId", backupOpert.getBackupOpertId());
		jobDetail.getJobDataMap().put("backupOrginlDrctry", backupOpert.getBackupOrginlDrctry());
		jobDetail.getJobDataMap().put("backupStreDrctry", backupOpert.getBackupStreDrctry());
		jobDetail.getJobDataMap().put("cmprsSe", backupOpert.getCmprsSe());

		try {
			// 스케줄러에 추가하기 
			sched.scheduleJob(jobDetail, trigger);
		} catch (SchedulerException e) {
			// SchedulerException 이 발생하면 로그를 출력하고 다음 백업작업으로 넘어간다. 
			// 트리거의 실행시각이 현재 시각보다 이전이면 SchedulerException이 발생한다. 
			log.error("스케줄러에 백업작업추가할때 에러가 발생했습니다. 백업작업ID : " + backupOpert.getBackupOpertId() );
			log.error("에러내용 : " + e.getMessage());
			log.debug(e.getMessage(), e);				
		}		
	}
	
	/**
	 * 백업스케줄러에 backupOpert 파라미터를 이용하여 Job , Trigger를 갱신 한다.
	 * 
	 * @param backupOpert  백업스케줄러에 갱신할 백업작업정보
	 * @exception Exception Exception
	 */
	public void updateBackupOpert(BackupOpert backupOpert) throws Exception {
		// Job 만들기 
		JobDetail jobDetail = new JobDetail();
		jobDetail.setName(backupOpert.getBackupOpertId());
		jobDetail.setJobClass(BackupJob.class);
		// Trigger 만들기 
		//Trigger trigger = TriggerUtils.makeImmediateTrigger(target.getBatchSchdulId(), 1, 1000000);
		CronTrigger trigger = new CronTrigger(backupOpert.getBackupOpertId(), null, backupOpert.toCronExpression());
		log.debug("백업스케줄을 갱신합니다. 백업작업ID : " + backupOpert.getBackupOpertId() );
		log.debug(backupOpert.getBackupOpertId() + " - cronexpression : " + trigger.getCronExpression());
		trigger.setJobName(jobDetail.getName());
		jobDetail.addJobListener(BackupJobListener.class.getName());
		
		// 데이터 전달 
		jobDetail.getJobDataMap().put("backupOpertId", backupOpert.getBackupOpertId());
		jobDetail.getJobDataMap().put("backupOrginlDrctry", backupOpert.getBackupOrginlDrctry());
		jobDetail.getJobDataMap().put("backupStreDrctry", backupOpert.getBackupStreDrctry());
		jobDetail.getJobDataMap().put("cmprsSe", backupOpert.getCmprsSe());

		try {
			// 스케줄러에서 기존Job, Trigger 삭제하기
			sched.deleteJob(jobDetail.getName(), jobDetail.getGroup());
			// 스케줄러에 추가하기 
			sched.scheduleJob(jobDetail, trigger);
		} catch (SchedulerException e) {
			// SchedulerException 이 발생하면 로그를 출력하고 다음 배치작업으로 넘어간다. 
			// 트리거의 실행시각이 현재 시각보다 이전이면 SchedulerException이 발생한다. 
			log.error("스케줄러에 백업작업갱신할때 에러가 발생했습니다. 백업작업ID : " + backupOpert.getBackupOpertId() );
			log.error("에러내용 : " + e.getMessage());
			log.debug(e.getMessage(), e);				
		}		
	}
	
	/**
	 * 백업스케줄러에 backupOpert 파라미터를 이용하여 Job , Trigger를 삭제한다.
	 * 
	 * @param backupOpert  백업스케줄러에 삭제할 백업작업정보
	 * @exception Exception Exception
	 */
	public void deleteBackupOpert(BackupOpert backupOpert) throws Exception {

		try {
			// 스케줄러에서 기존Job, Trigger 삭제하기
			log.debug("백업작업을 삭제합니다. 백업작업ID : " + backupOpert.getBackupOpertId() );
			sched.deleteJob(backupOpert.getBackupOpertId(), Scheduler.DEFAULT_GROUP);
		} catch (SchedulerException e) {
			// SchedulerException 이 발생하면 로그를 출력하고 다음 배치작업으로 넘어간다. 
			log.error("스케줄러에 백업작업을 삭제할때 에러가 발생했습니다. 배치스케줄ID : " + backupOpert.getBackupOpertId() );
			log.error("에러내용 : " + e.getMessage());
			log.debug(e.getMessage(), e);				
		}		
	}
	
	/**
	 * 클래스 초기화메소드.
	 * 배치스케줄테이블을 읽어서 Quartz 스케줄러를 초기화한다.  
	 * 
	 */
	public void init() throws Exception {
		// 모니터링 대상 정보 읽어들이기~~~
		List<BackupOpert> targetList = null;
		BackupOpert searchVO = new BackupOpert();
		// 모니터링 대상 검색 조건 초기화 
		searchVO.setPageIndex(1);
		searchVO.setFirstIndex(0);
		searchVO.setRecordCountPerPage(RECORD_COUNT_PER_PAGE);
		targetList = egovBackupOpertService.selectBackupOpertList(searchVO);
		log.debug("조회조건 " + searchVO);
		if (log.isDebugEnabled()) {
			log.debug("Result 건수 : " + targetList.size());
		}		
		
		// 스케줄러 생성하기
		SchedulerFactory schedFact = new org.quartz.impl.StdSchedulerFactory();
		sched = schedFact.getScheduler();
        // Set up the listener
		BackupJobListener listener = new BackupJobListener();
        listener.setEgovBackupOpertService(egovBackupOpertService);
        listener.setIdgenService(idgenService);
        sched.addJobListener(listener);

		// 스케줄러에 Job, Trigger 등록하기  
        BackupOpert target = null;
		for (int i = 0; i < targetList.size(); i++) {
			target = (BackupOpert)targetList.get(i);
			if (log.isDebugEnabled()) {
				log.debug("Data : " + target);
			}	
			
			insertBackupOpert(target);
		}
		sched.start();
	}

	/**
	 * 클래스 destroy메소드.
	 * Quartz 스케줄러를 shutdown한다.  
	 * 
	 */
	public void destroy() throws Exception {
		sched.shutdown();
	}
	
	/**
	 * 백업작업서비스 리턴
	 * @return the egovBackupSchdulService
	 */
	public EgovBackupOpertService getEgovBackupOpertService() {
		return egovBackupOpertService;
	}

	/**
	 * 백업작업서비스 저장. 
	 * @param egovBackupOpertService the egovBackupOpertService to set
	 */
	public void setEgovBackupOpertService(
			EgovBackupOpertService egovBackupOpertService) {
		this.egovBackupOpertService = egovBackupOpertService;
	}

	/**
	 * 백업결과ID 생성서비스 리턴
	 * @return the idgenService
	 */
	public EgovIdGnrService getIdgenService() {
		return idgenService;
	}

	/**
	 * 백업결과ID 생성서비스 저장.
	 * @param idgenService the idgenService to set
	 */
	public void setIdgenService(EgovIdGnrService idgenService) {
		this.idgenService = idgenService;
	}

}
