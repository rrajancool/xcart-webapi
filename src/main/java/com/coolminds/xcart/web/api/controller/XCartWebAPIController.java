package com.coolminds.xcart.web.api.controller;

import com.coolminds.xcart.web.api.model.CreateOrderRequest;
import com.coolminds.xcart.web.api.model.CreateResponse;
import com.coolminds.xcart.web.api.service.XCartWebAPIService;
import com.coolminds.xcart.web.api.util.XCartWebAPIConstants;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;

@RestController
public class XCartWebAPIController {

    XCartWebAPIService service;
    private static final Logger logger = LoggerFactory.getLogger(XCartWebAPIController.class);

    @Autowired
    public XCartWebAPIController(XCartWebAPIService service) {
        super();
        this.service = service;
    }

    @PostMapping(value="/web-api/order",produces = MediaType.APPLICATION_JSON_VALUE)
    public CreateResponse createOrder( @RequestHeader(XCartWebAPIConstants.REQUEST_PARAM_HEADER_JWT) String jwtToken,  @RequestBody @Valid CreateOrderRequest request){

        return new CreateResponse();
    }
}
