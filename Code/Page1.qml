import QtQuick 2.4

Page1Form {
    id:page1

    property string cityID: ""
    property bool flag: false
    signal setWeather(string cityID)


    function api()  {
        //console.log(language);
        var id
        var name=(textIn.text).trim()
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange=function() {

            flag=false;
            if (xmlhttp.readyState == XMLHttpRequest.DONE && xmlhttp.status == 200) {
                var JsonObject = JSON.parse(xmlhttp.responseText);
                var iconid = JsonObject.weather[0].icon
                var temp=JsonObject.main.temp

                //removes the elements after the dot so that the temperature whould be an integer
                if(temp.toString().includes(".")){
                    temp=temp.toString().split('.')[0];
                    console.log(temp)
                }
                flag=true
                if(unit=="metric"){
                   temperature.text=temp+" ºC"
                }else{
                    temperature.text=temp+" ºF"
                }



                cityID=JsonObject.id
                //console.log(cityID);
                wheatherDesc.text=JsonObject.weather[0].description
                id=JsonObject.weather[0].id
                setImage(id);
            }else{
                temperature.text=" ";
                wheatherDesc.text="";
                backgroundImage.source=""
                flag=false
            }



           // year.text = JsonObject.records[0].fields.year
        }
        page1.setWeather(name)
        page2.weather(name)
        xmlhttp.open('GET', 'http://api.openweathermap.org/data/2.5/weather?q='+name+'&APPID=2918e15f24f09f82c1ecdf6633ae97ce&units='+unit+'&lang='+language)
        xmlhttp.send();


    }



    function setImage(id){

        if(id==802){

            backgroundImage.source="forecast/scattered clouds.png"
        }
        if(id==803){

            backgroundImage.source="forecast/broken clouds.png"
        }
        if(id==801){

            backgroundImage.source="forecast/few clouds.png"
        }
        if(id>=701 && id<=781){

            backgroundImage.source="forecast/mist.png"
        }
        if(id>=500 && id<=531){

            backgroundImage.source="forecast/rain.png"
        }
        if(id>=300 && id<=321){

            backgroundImage.source="forecast/shower rain.png"
        }
        if(id>=600 && id<=622){

            backgroundImage.source="forecast/snow.png"
        }
        if(id>=200 && id<=232){

            backgroundImage.source="forecast/thunderstorm.png"
        }
        if(id==800){
            backgroundImage.source="forecast/clear.png"
        }

    }

    fav.visible: {
        //console.log(cityID)
        if(flag){
            true
        }else{
            false
        }
    }

    fav.onClicked: {
        if(flag){
            if(language=="en"){
              toast1.text = qsTr("Location Saved");
            }else{
                toast1.text=qsTr("Η τοποθεσία αποθηκεύτηκε")
            }
           // console.log("mpike")

            toast1.visible = true
            mediator.insertCity(textIn.text,cityID);
        }


    }





}
