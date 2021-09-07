package org.agrisud.elearningAPI.service;

import org.agrisud.elearningAPI.dao.HomeCoverDao;
import org.agrisud.elearningAPI.dao.HomeCoverImageDao;
import org.agrisud.elearningAPI.model.HomeCover;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Optional;

@Service
public class HomeCoverService {

    @Autowired
    HomeCoverDao homeCoverDao;

    @Autowired
    HomeCoverImageDao homeCoverImageDao;

    public Optional<Long> insertHomeCover(HomeCover homeCover) {
        return Optional.of(homeCoverDao.insertHomeCover(homeCover));
    }

    public Optional<HomeCover> getHomeCover() {
        return homeCoverDao.getHomeCover().map(homeCover -> {
            homeCoverImageDao.getHomeCoverImages().ifPresent(homeCover::setHomeCoverImages);
            return homeCover;
        });
    }
}
