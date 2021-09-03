package org.agrisud.elearningAPI.service;

import org.agrisud.elearningAPI.dao.ModuleDao;
import org.agrisud.elearningAPI.model.Module;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.Collections;
import java.util.Optional;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.Mockito.*;

@ExtendWith(MockitoExtension.class)
public class ModuleServiceTest {
    @Mock
    private ModuleDao moduleDao;
    @InjectMocks
    private ModuleService moduleService;
    Module module = new Module();

    @BeforeEach
    public void setUp() throws Exception {
        MockitoAnnotations.openMocks(this);
        module = Module.builder().id(1L).orderOnPath(1).title("Module 1").trainingPathTranslationID(1L).build();
    }

    @Test
    public void shouldGetModulesList() throws Exception {
        when(moduleDao.getModuleList()).thenReturn(Collections.singletonList(module));
        moduleService.getModuleList();
        verify(moduleDao, times(1)).getModuleList();
    }

    @Test
    public void shouldGetModuleById() throws Exception {
        when(moduleDao.getModuleById(anyLong())).thenReturn(Optional.ofNullable(module));
        moduleService.getModuleById(1L);
        verify(moduleDao, times(1)).getModuleById(anyLong());
    }

    @Test
    public void shouldGetModulesByTrainingPathId() throws Exception {
        when(moduleDao.getModuleListByTrainingPathTranslationID(anyLong())).thenReturn(Collections.singletonList(module));
        moduleService.getModuleListByTrainingPathTranslationID(1L);
        verify(moduleDao, times(1)).getModuleListByTrainingPathTranslationID(anyLong());
    }

    @Test
    void shouldCreateNewModule() throws Exception {
        when(moduleDao.createNewModule(any(Module.class))).thenReturn(1L);
        moduleService.createNewModule(module);
        verify(moduleDao, times(1)).createNewModule(any(Module.class));
    }

    @Test
    void shouldUpdateModule() throws Exception {
        doNothing().when(moduleDao).updateModule(any(Module.class));
        moduleService.updateModule(module);
        verify(moduleDao, times(1)).updateModule(any(Module.class));
    }

    @Test
    void shouldDeleteModule() throws Exception {
        doNothing().when(moduleDao).deleteModule(anyLong());
        moduleService.deleteModule(1L);
        verify(moduleDao, times(1)).deleteModule(anyLong());
    }
}
