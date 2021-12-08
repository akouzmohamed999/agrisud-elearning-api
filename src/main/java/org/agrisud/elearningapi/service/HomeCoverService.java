package org.agrisud.elearningapi.service;

import org.agrisud.elearningapi.dao.HomeCoverDao;
import org.agrisud.elearningapi.dao.HomeCoverImageDao;
import org.agrisud.elearningapi.model.HomeCover;
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
            homeCoverImageDao.getHomeCoverImages(homeCover.getId()).ifPresent(homeCover::setHomeCoverImages);
            return homeCover;
        });
    }
}
