package org.agrisud.elearningAPI.cloudservice;

import org.agrisud.elearningAPI.clouddao.CourseCloudDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CourseCloudService {

    @Autowired
    CourseCloudDao courseCloudDao;

    public List<String> getFolders() {
        return courseCloudDao.getEventFolders();
    }
}
