import QtQuick 2.4
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.0
import QtQuick.Controls 1.4

Page2Form {

    id: pageForm
    signal weather(string city)

    onWeather: {
        //clears the list if it already has elements
        if(list.count!=0){
            list.clear();
        }


        var name=city
        var xmlhttp = new XMLHttpRequest();
        xmlhttp.onreadystatechange=function() {
            if (xmlhttp.readyState == XMLHttpRequest.DONE && xmlhttp.status == 200) {
                var JsonObject = JSON.parse(xmlhttp.responseText);

                var i
                var iconid
                var date1=JsonObject.list[0].dt
                //var dat2=new Date(date1*1000)
               // console.log("The : " + new Date(date1*1000).toLocaleDateString("de_DE"))
               // console.log(Qt.formatDate(new Date(date1*1000),"ddd dd/M"))
                for(i=0; i<7;i++){
                    date1=JsonObject.list[i].dt
                    iconid=JsonObject.list[i].weather[0].icon
                    var temp=JsonObject.list[i].temp.day
                    var tempnight=JsonObject.list[i].temp.night

                    //removes the elements after the dot so that the temperature whould be an integer
                    if(temp.toString().includes(".")){
                        temp=temp.toString().split('.')[0];

                    }
                    if(tempnight.toString().includes(".")){
                        tempnight=tempnight.toString().split('.')[0];

                    }

                    if(unit=="metric"){
                        list.append({"date":Qt.formatDate(new Date(date1*1000),"dd/M") ,"day":temp+" ºC","icon":"http://openweathermap.org/img/w/"+iconid+".png","night":tempnight+" ºC"})
                    }else{
                        list.append({"date":Qt.formatDate(new Date(date1*1000),"dd/M") ,"day":temp+" ºF","icon":"http://openweathermap.org/img/w/"+iconid+".png","night":tempnight+" ºF"})
                    }

                   // list.append({"date":Qt.formatDate(new Date(date1*1000),"dd/M") ,"day":JsonObject.list[i].temp.day,"icon":"http://openweathermap.org/img/w/"+iconid+".png","night":JsonObject.list[i].temp.night})
                }




            }

        }
        //enallaktikos kwdikos se periptwsh pou den douleuei o prwtos
        //xmlhttp.open('GET', 'http://api.openweathermap.org/data/2.5/forecast/daily?q='+name+'&APPID=bd5e378503939ddaee76f12ad7a97608&units='+unit+'&lang='+language)
        xmlhttp.open('GET', 'http://api.openweathermap.org/data/2.5/forecast/daily?q='+name+'&APPID=fc61e15c687ad6fca59495735cdf3719&units='+unit+'&lang='+language)
        xmlhttp.send();
    }






    ListView {
        id: listView
        anchors.fill: parent
        clip: true
        model: list
        delegate: Item {
               width: parent.width
               height: pageForm.height/12
               Rectangle {

                   anchors.fill: parent
                   anchors.topMargin: 1
                   anchors.bottomMargin: 1
                   color: "transparent"
                   id: rec
                   RowLayout{
                       //spacing: 100
                       anchors.fill: parent
                       Label{
                           id:label1
                           text: date
                           anchors.left: parent.left
                           anchors.leftMargin: 5
                           font.pixelSize:18
                           color: "white"
                       }

                       Label {
                           id: label2
                           anchors.left: parent.left
                           anchors.leftMargin: 100
                           text: day
                           color: "white"
                           font.pixelSize: 18
                       }
                       Label{
                           text:night
                           //verticalAlignment: "AlignVCenter"
                           anchors.left: parent.left
                           anchors.leftMargin: 200
                           font.pixelSize: 18
                           color: "white"
                       }

                       Image{
                           source: icon
                           anchors.right: parent.right
                       }
                   }



               }
               Rectangle {
                   height: 1
                   color: 'blue'
                   anchors {
                       left: rec.left
                       right:rec.right
                       top: rec.bottom
                   }
               }
           }
        header: Rectangle {

            width: parent.width; height: pageForm.height/10;
            color:"#5ca6e3"
            RowLayout{
                anchors.fill: parent
               // spacing: 100
                Label{
                    id: dateLabel
                    font.pointSize: 18
                    anchors.leftMargin: 5
                    //width: parent.width/4
                    anchors.left: parent.left
                    text: {
                            if(language=="en"){
                                "Date"
                            }else{
                                "Η/Μ"
                            }

                        }

                    color: "white"

                }

                Label{
                    id: dayLabel
                    font.pointSize: 18
                    anchors.leftMargin: 100
                    //width: parent.width/4
                    anchors.left: parent.left
                    text: {
                            if(language=="en"){
                                "Day"
                            }else{
                                "Πρωί"
                            }

                        }
                    color: "white"
                }


                Label{
                    id: nightLabel
                    font.pointSize: 18
                    anchors.leftMargin:  200
                    //width: parent.width/4
                    anchors.left: parent.left

                    text: {
                            if(language=="en"){
                                "Night"
                            }else{
                                "Βράδυ"
                            }

                        }
                    color: "white"
                }


            }
        }
    }



}
