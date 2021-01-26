     function confirmDelete_p (event_opl) {
        if ((event_opl.target.tagName.toLowerCase() == 'a' )&&
            (event_opl.target.className == "clDelete") ) {
                if(confirm('Wollen Sie den Datensatz wirklich loeschen?')){

                }
                else{
                    onsubmit(event_opl)
                }
                }
            }






function addInput(){

        var div = document.getElementById('inputs_div');
        var clone = div.cloneNode(true);

        document.getElementById('inputs_container').appendChild(clone);


}


function select_Weiter(data) {


                var p = document.getElementById('create_check');
                var i = 0;

                for (var prop in data) {
                    var checkbox = document.createElement('input');

                        if (data[prop].status === "None"){
                            data[prop].status = "angemeldet"
                        }


                            var checkbox_str = JSON.stringify(data[prop]);


                            checkbox.type = "checkbox";
                            checkbox.id = "Weiterbildung_spa_" + i;
                            checkbox.name = "Weiterbildung_spa";
                            checkbox.value = checkbox_str;

                            var label = document.createElement('label');
                            var tn = document.createTextNode(JSON.stringify(data[prop]["bezeichnung"]));
                            label.htmlFor = "cbid";
                            label.appendChild(tn);
                            p.appendChild(label);
                            p.appendChild(checkbox);


                        i++;


     }
 }

window.onload = function () {
                    let body_o = document.getElementsByTagName('body')[0];
                    body_o.addEventListener('click', confirmDelete_p, false);
                    body_o.addEventListener('load', sortTable(), false);

}





