// Copyright (c) 2018, WSO2 Inc. (http://www.wso2.org) All Rights Reserved.
//
// WSO2 Inc. licenses this file to you under the Apache License,
// Version 2.0 (the "License"); you may not use this file except
// in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing,
// software distributed under the License is distributed on an
// "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
// KIND, either express or implied.  See the License for the
// specific language governing permissions and limitations
// under the License.

import ballerina/log;
import ballerina/test;
import ballerina/io;

Soap11Client soap11Client = new ("http://ws.cdyne.com/phoneverify/phoneverify.asmx?wsdl");

@test:Config {}
function testSendReceive() {
    log:print("soap11Client -> sendReceive()");

    xml body = xml `<quer:CheckPhoneNumber xmlns:quer="http://ws.cdyne.com/PhoneVerify/query"> 
         <quer:PhoneNumber>18006785432</quer:PhoneNumber>
         <quer:LicenseKey>0</quer:LicenseKey>
      </quer:CheckPhoneNumber>`;

    var response = soap11Client->sendReceive(body, "http://ws.cdyne.com/PhoneVerify/query/CheckPhoneNumber");
    if (response is SoapResponse) {
        io:print(response);
        test:assertEquals(response.soapVersion, SOAP11);
    } else {
        test:assertFail(msg = response.message());
    }
}
