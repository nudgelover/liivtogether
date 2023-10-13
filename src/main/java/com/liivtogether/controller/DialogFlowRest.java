package com.liivtogether.controller;

import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.services.dialogflow.v2beta1.model.GoogleCloudDialogflowV2WebhookRequest;
import com.google.api.services.dialogflow.v2beta1.model.GoogleCloudDialogflowV2WebhookResponse;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.Map;


@RestController
@RequestMapping("/orchid/api")
public class DialogFlowRest {

    private static JacksonFactory jacksonFactory = JacksonFactory.getDefaultInstance();

    @RequestMapping(method = RequestMethod.POST, value = "/dialogFlowWebHook")
    public ResponseEntity<?> dialogFlowWebHook(@RequestBody String requestStr, HttpServletRequest servletRequest) throws IOException {

        try {

            GoogleCloudDialogflowV2WebhookResponse response = new GoogleCloudDialogflowV2WebhookResponse(); // response 객체
            GoogleCloudDialogflowV2WebhookRequest request = jacksonFactory.createJsonParser(requestStr).parse(GoogleCloudDialogflowV2WebhookRequest.class); // request 객체에서 파싱

            Map<String,Object> params = request.getQueryResult().getParameters(); // 파라미터 받아서 map에다 저장
            String text = request.getQueryResult().getFulfillmentText();
            if (text != null) {
               // System.out.println(text);
                response.setFulfillmentText(text);
            }
            else {
                response.setFulfillmentText("Sorry you didn't send enough to process");
            }

            return new ResponseEntity<GoogleCloudDialogflowV2WebhookResponse>(response, HttpStatus.OK);
        }
        catch (Exception ex) {
            return new ResponseEntity<Object>(ex.getMessage(),HttpStatus.BAD_REQUEST); // 에러 발생 시 bad request 보내줌
        }
    }
}