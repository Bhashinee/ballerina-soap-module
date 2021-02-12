# SOAP Connector

The SOAP connector allows you to send an ordinary XML request to a SOAP backend by specifying the necessary details to
construct a SOAP envelope. It abstracts out the details of the creation of a SOAP envelope, headers, and the body in a
SOAP message.

## Compatibility

|                          |      Versions      |
|:------------------------:|:------------------:|
| Ballerina Language       | Swan Lake Alpha1 |
| SOAP Version             | 1.1 & 1.2          |

## Getting Started

Refer the [Getting Started](https://ballerina.io/learn/getting-started/) guide to download and install Ballerina.

### Usage Example

```ballerina
import ballerina/io;
import bash/soap;
  
public function main () {

    soap:Soap12Client soapClient = new("http://ws.cdyne.com/phoneverify/phoneverify.asmx?wsdl");

    xml body = xml `<quer:CheckPhoneNumber xmlns:quer="http://ws.cdyne.com/PhoneVerify/query"> 
         <quer:PhoneNumber>18006785432</quer:PhoneNumber>
         <quer:LicenseKey>0</quer:LicenseKey>
      </quer:CheckPhoneNumber>`;

    var response = soapClient->sendReceive(body);
    if (response is soap:SoapResponse) {
        io:println(response["payload"]);
    } else {
        io:println(response.message());
    }
}
```

Follow the steps below to run this example.

1. Save the example in a Ballerina file (e.g., `soapExample.bal`).
2. Execute the `ballerina run soapExample.bal` command to run the file.
You will get a response similar to the following.

```xml
<?xml version="1.0" encoding="UTF-8"?>
<soap:Body xmlns:soap="http://www.w3.org/2003/05/soap-envelope">
   <CheckPhoneNumberResponse xmlns="http://ws.cdyne.com/PhoneVerify/query">
      <CheckPhoneNumberResult>
         <Company>Toll Free</Company>
         <Valid>true</Valid>
         <Use>Assigned to a code holder for normal use.</Use>
         <State>TF</State>
         <RC />
         <OCN />
         <OriginalNumber>18006785432</OriginalNumber>
         <CleanNumber>8006785432</CleanNumber>
         <SwitchName />
         <SwitchType />
         <Country>United States</Country>
         <CLLI />
         <PrefixType>Landline</PrefixType>
         <LATA />
         <sms>Landline</sms>
         <Email />
         <AssignDate>Unknown</AssignDate>
         <TelecomCity />
         <TelecomCounty />
         <TelecomState>TF</TelecomState>
         <TelecomZip />
         <TimeZone />
         <Lat />
         <Long />
         <Wireless>false</Wireless>
         <LRN />
      </CheckPhoneNumberResult>
   </CheckPhoneNumberResponse>
</soap:Body>
```
