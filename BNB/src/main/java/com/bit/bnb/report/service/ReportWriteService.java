package com.bit.bnb.report.service;

import com.bit.bnb.mypage.service.MypageUserDeleteService;
import com.bit.bnb.mypage.service.ProfileEditService;
import com.bit.bnb.report.dao.ReportDao;
import com.bit.bnb.report.model.ReportVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class ReportWriteService {

    @Autowired
    private ReportDao dao;

    @Autowired
    private MypageUserDeleteService deleteService;

    public void insertt(ReportVO vo) {

        dao.insert(vo);
    }

    @Transactional
    public void ckupdate(ReportVO vo) {
        dao.ckupdate(vo);
        if (vo.getReportCk().equals("T")) {
            ReportVO reportVO = dao.getHostId(vo);
            int reportCount = dao.hostGetReportCk(reportVO);
            if (reportCount == 3) {
                deleteService.userDelete(reportVO.getHostId());
                dao.roomDisabled(reportVO.getHostId());
            }
        }
    }
}
