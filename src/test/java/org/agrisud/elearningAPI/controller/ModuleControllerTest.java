package org.agrisud.elearningAPI.controller;

import com.fasterxml.jackson.databind.ObjectMapper;
import org.agrisud.elearningAPI.model.Module;
import org.agrisud.elearningAPI.service.ModuleService;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.http.MediaType;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.web.servlet.MockMvc;

import java.util.Collections;
import java.util.Optional;

import static org.mockito.ArgumentMatchers.any;
import static org.mockito.ArgumentMatchers.anyLong;
import static org.mockito.Mockito.*;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.*;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc(addFilters = false)
@ActiveProfiles("test")
public class ModuleControllerTest {
    @Autowired
    private MockMvc mockMvc;
    @MockBean
    private ModuleService moduleService;

    Module module = new Module();

    @BeforeEach
    public void setUp() throws Exception {
        module = Module.builder().id(1L).orderOnPath(1).title("Module 1").trainingPathID(1L).build();
    }

    @Test
    public void shouldGetModulesListRequestReturn200() throws Exception {
        when(moduleService.getModuleList()).thenReturn(Collections.singletonList(module));
        mockMvc.perform(get("/module/list"))
                .andExpect(status().isOk());
        verify(moduleService, times(1)).getModuleList();
    }

    @Test
    public void shouldGetModuleByIdRequestReturn200() throws Exception {
        when(moduleService.getModuleById(anyLong())).thenReturn(Optional.ofNullable(module));
        mockMvc.perform(get("/module/{moduleID}", 1))
                .andExpect(status().isOk());
        verify(moduleService, times(1)).getModuleById(anyLong());
    }

    @Test
    public void shouldGetModulesByTrainingPathIdRequestReturn200() throws Exception {
        when(moduleService.getModuleListByTrainingPathID(anyLong())).thenReturn(Collections.singletonList(module));
        mockMvc.perform(get("/module/trainingPath/{trainingPathID}", 1))
                .andExpect(status().isOk());
        verify(moduleService, times(1)).getModuleListByTrainingPathID(anyLong());
    }

    @Test
    void shouldCreateNewModuleRequestReturn200() throws Exception {
        when(moduleService.createNewModule(any(Module.class))).thenReturn(1L);
        mockMvc.perform(post("/module")
                .content(asJsonString(module))
                .contentType(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON)).andExpect(status().isOk());
        verify(moduleService, times(1)).createNewModule(any(Module.class));
    }

    @Test
    void shouldUpdateModuleRequestReturn200() throws Exception {
        doNothing().when(moduleService).updateModule(any(Module.class));
        mockMvc.perform(put("/module")
                .content(asJsonString(module))
                .contentType(MediaType.APPLICATION_JSON).accept(MediaType.APPLICATION_JSON)).andExpect(status().isOk());
        verify(moduleService, times(1)).updateModule(any(Module.class));
    }

    @Test
    void shouldDeleteModuleRequestReturn200() throws Exception {
        doNothing().when(moduleService).deleteModule(anyLong());
        mockMvc.perform(delete("/module/{moduleID}", 1)).andExpect(status().isOk());
        verify(moduleService, times(1)).deleteModule(anyLong());
    }

    private static String asJsonString(final Object obj) {
        try {
            return new ObjectMapper().writeValueAsString(obj);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
