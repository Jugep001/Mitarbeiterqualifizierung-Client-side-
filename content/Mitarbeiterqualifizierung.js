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
            window.onload = function () {
                    let body_o = document.getElementsByTagName('body')[0];
                    body_o.addEventListener('click', confirmDelete_p, false);
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


     function sortTable() {


        var table, switching, i, x, y;
        table = document.getElementById("Mitarbeitertabelle");//access table
        switching = true;

            while (switching) {

                switching = false;


            for (i = 1; i < (table.rows.length - 1); i++) {

                x = table.rows[i].getElementsByTagName("TD")[0];
                y = table.rows[i + 1].getElementsByTagName("TD")[0];

            if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {

                table.rows[i].parentNode.insertBefore(table.rows[i + 1], table.rows[i]);
                switching = true;
                break;

       }
     }

   }
 }

 function sortTable2() {

   var table,switching, i, x, y;
   table = document.getElementById("Mitarbeitertabelle");
   switching = true;

        while (switching) {

            switching = false;


        for (i = 1; i < (table.rows.length - 1); i++) {

            x = table.rows[i].getElementsByTagName("TD")[5];
            y = table.rows[i + 1].getElementsByTagName("TD")[5];
            var xdate=new Date(x.innerHTML);
            var ydate=new Date(y.innerHTML);

        if (xdate > ydate) {

            table.rows[i].parentNode.insertBefore(table.rows[i + 1], table.rows[i]);
            switching = true;
            break;

       }
     }

   }

 }


