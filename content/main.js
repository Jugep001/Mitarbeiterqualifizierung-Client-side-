//------------------------------------------------------------------------------
//Demonstrator evs/tco/tmg
//------------------------------------------------------------------------------
// rev. 1, 18.12.2020, Bm
// rev. 0, 21.11.2018, Bm
//------------------------------------------------------------------------------
// hier zur Vereinfachung (!) die Klassen in einer Datei

'use strict'

let Mit_table_id = null;
let Weiter_table_id = null;

//------------------------------------------------------------------------------
class Startseite_cl {
//------------------------------------------------------------------------------

   constructor (el_spl, template_spl) {
      this.el_s = el_spl;
      this.template_s = template_spl;
      this.configHandleEvent_p();
   }

   close_px () {
      this.exitHandler_p();
   }

   exitHandler_p () {
      // Ereignisverarbeitung für das Formular aufheben
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.removeEventListener("click", this.handleEvent_p);
      }
   }

   async render_px (data_opl) {
       // Daten anfordern
      let result_array = [];
      let path_s = "/Mitarbeiter/";
      let requester_o = new APPUTIL.Requester_cl();
      await requester_o.GET_px(path_s)
      .then (result_spl => {
            result_array[0] = JSON.parse(result_spl);
            //this.doRender_p(JSON.parse(result_spl));

      })
      .catch (error_opl => {
         alert("fetch-error (get)");
      });
      requester_o.GET_px("/Weiterbildung/")
      .then (result_spl => {
            result_array[1] = JSON.parse(result_spl);

            this.doRender_p(result_array);


      })
      .catch (error_opl => {
         alert("fetch-error (get)");
      });
   }
   async doRender_p (data_opl) {
      let markup_s = APPUTIL.tm_o.execute_px(this.template_s, data_opl);
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.innerHTML = markup_s;
      }
   }
   configHandleEvent_p () {
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.addEventListener("click", this.handleEvent_p);
      }
   }
   handleEvent_p (event_opl) {
      let cmd_s = event_opl.target.dataset.action;
      APPUTIL.es_o.publish_px("app.cmd", [cmd_s, null]);
   }
}

//------------------------------------------------------------------------------
class PflegeMit_o {
//------------------------------------------------------------------------------

   constructor (el_spl, template_spl) {
      this.el_s = el_spl;
      this.template_s = template_spl;
      this.configHandleEvent_p();
   }
   render_px (data_opl) {
       // Daten anfordern
      let path_s = "/Mitarbeiter/";
      let requester_o = new APPUTIL.Requester_cl();
      if(data_opl === "MitarbeiterFormDelete"){
         this.onClickDelete();
      }

      requester_o.GET_px(path_s)
      .then (result_spl => {
            this.doRender_p(JSON.parse(result_spl));
      })
      .catch (error_opl => {
         alert("fetch-error (get)");
      });
   }
   async onClickDelete(){
      if (Mit_table_id != null) {

               if (confirm("Soll der Datensatz gelöscht werden?")) {
                  // Id der selektierten Tabellenzeile anhängen

                  let path_s = "/Mitarbeiter/" + Mit_table_id;
                  let result_o = APPUTIL.requester_o.DELETE_px(path_s);
                  Mit_table_id = null;
                  await this.render_px();

               }
            }
   }
   doRender_p (data_opl) {
      let markup_s = APPUTIL.tm_o.execute_px(this.template_s, data_opl);
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.innerHTML = markup_s;
      }
   }
   close_px () {
      this.exitHandler_p();
   }

   exitHandler_p () {
      // Ereignisverarbeitung für das Formular aufheben
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.removeEventListener("click", this.handleEvent_p);
      }
   }
   configHandleEvent_p () {
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.addEventListener("click", this.handleEvent_p);
      }
   }
   handleEvent_p (event_opl) {
      let cmd_s = event_opl.target.dataset.action;
      APPUTIL.es_o.publish_px("app.cmd", [cmd_s, null]);

   }
}
//------------------------------------------------------------------------------
class PflegeMitDetail_o {
//------------------------------------------------------------------------------

   constructor (el_spl, template_spl) {
      this.el_s = el_spl;
      this.template_s = template_spl;
      this.configHandleEvent_p();
   }
   render_px (data_opl) {
       // Daten anfordern
      let path_s = "/Mitarbeiter/";
      let requester_o = new APPUTIL.Requester_cl();
      if(data_opl === "MitarbeiterDetailFormDelete"){

         this.onClickDelete();

      }
      requester_o.GET_px(path_s)
      .then (result_spl => {
            console.log(result_spl)
            this.doRender_p(JSON.parse(result_spl));
      })
      .catch (error_opl => {
         alert("fetch-error (get)");
      });
   }

   onClickDelete(){
      if (Mit_table_id != null) {

               if (confirm("Soll der Datensatz gelöscht werden?")) {
                  // Id der selektierten Tabellenzeile anhängen

                  let path_s = "/Mitarbeiter/" + Mit_table_id;
                  let result_o = APPUTIL.requester_o.DELETE_px(path_s);
                  Mit_table_id = null;
                  this.render_px();

               }
            }
   }

   doRender_p (data_opl) {
      let markup_s = APPUTIL.tm_o.execute_px(this.template_s, data_opl);
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.innerHTML = markup_s;
      }
   }
   close_px () {
      this.exitHandler_p();
   }

   exitHandler_p () {
      // Ereignisverarbeitung für das Formular aufheben
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.removeEventListener("click", this.handleEvent_p);
      }
   }
   configHandleEvent_p () {
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.addEventListener("click", this.handleEvent_p);
      }
   }
   handleEvent_p (event_opl) {
      let cmd_s = event_opl.target.dataset.action;
      APPUTIL.es_o.publish_px("app.cmd", [cmd_s, null]);
   }
}

class MitarbeiterForm_o {
//------------------------------------------------------------------------------

   constructor (el_spl, template_spl) {
      this.el_s = el_spl;
      this.template_s = template_spl;
      this.data_opl = null;
      this.result_opl = null;
   }
   render_px (data_opl) {
       // Daten anfordern
      this.data_opl = data_opl
      let path_s = "/Mitarbeiter/";
      if (data_opl === "MitarbeiterForm"){
         Mit_table_id = null;
      }

       if (Mit_table_id != null) {
         path_s = path_s + Mit_table_id;
      } 
      let requester_o = new APPUTIL.Requester_cl();
      requester_o.GET_px(path_s)
      .then (result_spl => {
            this.doRender_p(JSON.parse(result_spl));
      })
      .catch (error_opl => {
         alert("fetch-error (get)");
      });

   }


   doRender_p (data_opl) {
      let markup_s = APPUTIL.tm_o.execute_px(this.template_s, data_opl);
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.innerHTML = markup_s;
         this.result_opl = data_opl;
         this.configHandleEvent_p();
      }
   }
   close_px () {
      this.exitHandler_p();
   }

   exitHandler_p () {
      // Ereignisverarbeitung für das Formular aufheben
      const form = document.getElementById('idForm');
      if(form != null){
         form.removeEventListener("submit", this.handleSubmit_p.bind(this));
      }

   }
   configHandleEvent_p () {
      const form = document.getElementById('idForm');
      if(form != null) {
         form.addEventListener("submit", this.handleSubmit_p.bind(this));
      }



   }
   handleSubmit_p (event_opl) {
      let form_o = document.querySelector("form");
      if (form_o != null) {
         let fd_o = this.getFormData_px(form_o);
         console.log(fd_o["id_spa"])

         let result_o = {};
         if (Mit_table_id == null) {                 // Id bereits vorhanden?
            this.saveNewData_p(fd_o)             // Speicherung neuer Daten
            .then((result_opl) => { result_o = result_opl; });
         } else {
            this.saveOldData_p(fd_o)             // Aktualisierung bestehender Daten
            .then((result_opl) => { result_o = result_opl; });
         }
         if ("error" in result_o) {
            alert("Fehler beim Speichern der Daten aufgetreten");
         } else {

            let id_s = fd_o["id_spa"]; // mit Pfad "bestellungen/"
            let el_o = document.getElementById("id_spa");
            el_o.value = id_s;                         // Id der neuen Daten wird vermerkt
            alert("Gespeichert!");
         }
      }
      // keine Standard-Formularverarbeitung
      event_opl.preventDefault();
      event_opl.stopPropagation();
   }
      async saveNewData_p (data_opl) {
      let path_s = '/Mitarbeiter/'; //Pfad für das POST
      console.log(data_opl);
      let result_o = await APPUTIL.requester_o.POST_px(path_s, data_opl); //data_opl beeinhaltet alle Formular Daten
      console.log(JSON.stringify(result_o)); //gibt 404 aus
      return result_o;
   }

   async saveOldData_p (data_opl) {

      let path_s = "/Mitarbeiter/" + Mit_table_id;
      let result_o = await APPUTIL.requester_o.PUT_px(path_s, data_opl);
      console.log(JSON.stringify(result_o));
      Mit_table_id = null;
      return result_o;

   }
   getFormData_px (form_opl) {
      let data_o = null;
      // auf die einzelnen Formularfelder und -werte zugreifen und als String ablegen
      let formData_o = new FormData(form_opl);
      data_o = {};
      let Weiterbildung_spa = null;
      Weiterbildung_spa = this.result_opl["Weiterbildung"];


      for(let pair_a of formData_o.entries()) {

         data_o[pair_a[0]] = pair_a[1];
      }
      console.log(Weiterbildung_spa)
      data_o["Weiterbildung_spa"] = Weiterbildung_spa;
      return data_o;
   }
}

//------------------------------------------------------------------------------
class PflegeWeiter_o {
//------------------------------------------------------------------------------

   constructor (el_spl, template_spl) {
      this.el_s = el_spl;
      this.template_s = template_spl;
      this.configHandleEvent_p();
   }
    render_px (data_opl) {
       // Daten anfordern
      let path_s = "/Weiterbildung/";
      let requester_o = new APPUTIL.Requester_cl();
      if(data_opl === "WeiterbildungFormDelete"){
         this.onClickDelete();
      }
      requester_o.GET_px(path_s)
      .then (result_spl => {
            this.doRender_p(JSON.parse(result_spl));
      })
      .catch (error_opl => {
         alert("fetch-error (get)");
      });
   }
   onClickDelete(){
      if (Weiter_table_id != null) {

               if (confirm("Soll der Datensatz gelöscht werden?")) {
                  // Id der selektierten Tabellenzeile anhängen

                  let path_s = "/Weiterbildung/" + Weiter_table_id;
                  let result_o = APPUTIL.requester_o.DELETE_px(path_s);
                  Weiter_table_id = null;
                  this.render_px();

               }
            }
   }

   doRender_p (data_opl) {
      let markup_s = APPUTIL.tm_o.execute_px(this.template_s, data_opl);
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.innerHTML = markup_s;
      }
   }
   close_px () {
      this.exitHandler_p();
   }

   exitHandler_p () {
      // Ereignisverarbeitung für das Formular aufheben
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.removeEventListener("click", this.handleEvent_p);
      }
   }
   configHandleEvent_p () {
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.addEventListener("click", this.handleEvent_p);
      }
   }
   handleEvent_p (event_opl) {
      let cmd_s = event_opl.target.dataset.action;
      APPUTIL.es_o.publish_px("app.cmd", [cmd_s, null]);
   }
}
//------------------------------------------------------------------------------
class PflegeWeiterDetail_o {
//------------------------------------------------------------------------------

   constructor (el_spl, template_spl) {
      this.el_s = el_spl;
      this.template_s = template_spl;
      this.configHandleEvent_p();
   }
   async render_px (data_opl) {
       // Daten anfordern
      let result_array = [];
      let path_s = "/Weiterbildung/";
      let requester_o = new APPUTIL.Requester_cl();
      if(data_opl === "WeiterbildungDetailFormDelete"){
         this.onClickDelete();
      }
      await requester_o.GET_px(path_s)
      .then (result_spl => {
            result_array[0] = JSON.parse(result_spl);
            //this.doRender_p(JSON.parse(result_spl));

      })
      .catch (error_opl => {
         alert("fetch-error (get)");
      });
      requester_o.GET_px("/Mitarbeiter/")
      .then (result_spl => {
            result_array[1] = JSON.parse(result_spl);
            this.doRender_p(result_array);

      })
      .catch (error_opl => {
         alert("fetch-error (get)");
      });
   }
   onClickDelete(){
      if (Weiter_table_id != null) {

               if (confirm("Soll der Datensatz gelöscht werden?")) {
                  // Id der selektierten Tabellenzeile anhängen

                  let path_s = "/Weiterbildung/" + Weiter_table_id;
                  let result_o = APPUTIL.requester_o.DELETE_px(path_s);
                  Weiter_table_id = null;
                  this.render_px();

               }
            }
   }
   doRender_p (data_opl) {
      let markup_s = APPUTIL.tm_o.execute_px(this.template_s, data_opl);
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.innerHTML = markup_s;
      }
   }
   close_px () {
      this.exitHandler_p();
   }

   exitHandler_p () {
      // Ereignisverarbeitung für das Formular aufheben
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.removeEventListener("click", this.handleEvent_p);
      }
   }
   configHandleEvent_p () {
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.addEventListener("click", this.handleEvent_p);
      }
   }
   handleEvent_p (event_opl) {
      let cmd_s = event_opl.target.dataset.action;
      APPUTIL.es_o.publish_px("app.cmd", [cmd_s, null]);
   }
}
class WeiterbildungForm_o {
//------------------------------------------------------------------------------

    constructor (el_spl, template_spl) {
      this.el_s = el_spl;
      this.template_s = template_spl;
      this.data_opl = null;
   }
   async render_px (data_opl) {
       // Daten anfordern
      this.data_opl = data_opl
      let path_s = "/Weiterbildung/";
      if (data_opl === "WeiterbildungForm"){
         Weiter_table_id = null;
      }
       if (Weiter_table_id != null) {
         path_s = path_s + Weiter_table_id;
      }
      let requester_o = new APPUTIL.Requester_cl();
      requester_o.GET_px(path_s)
      .then (result_spl => {
            this.doRender_p(JSON.parse(result_spl));
      })
      .catch (error_opl => {
         alert("fetch-error (get)");
      });

   }
   doRender_p (data_opl) {
      let markup_s = APPUTIL.tm_o.execute_px(this.template_s, data_opl);
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.innerHTML = markup_s;
         this.configHandleEvent_p();
      }
   }
   close_px () {
      this.exitHandler_p();
   }

   exitHandler_p () {
      // Ereignisverarbeitung für das Formular aufheben
      const form = document.getElementById("idForm2")
      if(form != null) {
         form.removeEventListener("submit", this.handleSubmit_p.bind(this));
      }
   }
   configHandleEvent_p () {
      const form = document.getElementById('idForm2');
      if(form != null) {
         form.addEventListener("submit", this.handleSubmit_p.bind(this));
      }
   }
   handleSubmit_p (event_opl) {
      let form_o = document.querySelector("form");
      if (form_o != null) {
         let fd_o = this.getFormData_px(form_o);


         let result_o = {};
         if (Weiter_table_id == null) {                 // Id bereits vorhanden?
            this.saveNewData_p(fd_o)             // Speicherung neuer Daten
            .then((result_opl) => { result_o = result_opl; });
         } else {
            this.saveOldData_p(fd_o)             // Aktualisierung bestehender Daten
            .then((result_opl) => { result_o = result_opl; });
         }
         if ("error" in result_o) {
            alert("Fehler beim Speichern der Daten aufgetreten");
         } else {

            let id_s = fd_o["id_spa"]; // mit Pfad "bestellungen/"
            let el_o = document.getElementById("id_spa");
            el_o.value = id_s;                         // Id der neuen Daten wird vermerkt
            alert("Gespeichert!");
         }
      }
      // keine Standard-Formularverarbeitung
      event_opl.preventDefault();
      event_opl.stopPropagation();
   }
      async saveNewData_p (data_opl) {
      let path_s = '/Weiterbildung/'; //Pfad für das POST
      let result_o = await APPUTIL.requester_o.POST_px(path_s, data_opl); //data_opl beeinhaltet alle Formular Daten
      console.log(JSON.stringify(result_o)); //gibt 404 aus
      return result_o;
   }

   async saveOldData_p (data_opl) {

      let path_s = "/Weiterbildung/" + Weiter_table_id;
      let result_o = await APPUTIL.requester_o.PUT_px(path_s, data_opl);
      console.log(JSON.stringify(result_o));
      Weiter_table_id = null;
      return result_o;

   }
   getFormData_px (form_opl) {
      let data_o = null;
      // auf die einzelnen Formularfelder und -werte zugreifen und als String ablegen
      let formData_o = new FormData(form_opl);
      let bezeichnung_quali_spa = [];
      let beschreibung_quali_spa = [];
      let i = 0;
      let j = 0;
      data_o = {};

      for(let pair_a of formData_o.entries()) {
         if(pair_a[0] === "bezeichnung_quali_spa"){
            bezeichnung_quali_spa[i] = pair_a[1];
            i++;
         }
         else if(pair_a[0] === "beschreibung_quali_spa"){
            beschreibung_quali_spa[j] = pair_a[1];
            j++;
         }
      }
      formData_o.delete("bezeichnung_quali_spa");
      formData_o.delete("beschreibung_quali_spa");


      for(let pair_a of formData_o.entries()) {
         console.log(pair_a)
         data_o[pair_a[0]] = pair_a[1];
      }
      data_o["bezeichnung_quali_spa"] = bezeichnung_quali_spa;
      data_o["beschreibung_quali_spa"] = beschreibung_quali_spa;
      return data_o;
   }
}
//------------------------------------------------------------------------------
class SichtMit_o {
//------------------------------------------------------------------------------

   constructor (el_spl, template_spl) {
      this.el_s = el_spl;
      this.template_s = template_spl;
      this.configHandleEvent_p();
   }
   render_px (data_opl) {
       // Daten anfordern
      let path_s = "/Mitarbeiter/";
      let requester_o = new APPUTIL.Requester_cl();
      requester_o.GET_px(path_s)
      .then (result_spl => {
            this.doRender_p(JSON.parse(result_spl));
      })
      .catch (error_opl => {
         alert("fetch-error (get)");
      });
   }
   doRender_p (data_opl) {
      let markup_s = APPUTIL.tm_o.execute_px(this.template_s, data_opl);
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.innerHTML = markup_s;
      }
   }
   close_px () {
      this.exitHandler_p();
   }

   exitHandler_p () {
      // Ereignisverarbeitung für das Formular aufheben
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.removeEventListener("click", this.handleEvent_p);
      }
   }
   configHandleEvent_p () {
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.addEventListener("click", this.handleEvent_p);
      }
   }
   handleEvent_p (event_opl) {
      let cmd_s = event_opl.target.dataset.action;
      APPUTIL.es_o.publish_px("app.cmd", [cmd_s, null]);
   }
}
//------------------------------------------------------------------------------
class SichtMitForm_o {
//------------------------------------------------------------------------------

   constructor (el_spl, template_spl) {
      this.el_s = el_spl;
      this.template_s = template_spl;

   }
   async render_px (data_opl) {
       // Daten anfordern
      let result_array = [];
      let path_s = "/Mitarbeiter/" + Mit_table_id;
      let requester_o = new APPUTIL.Requester_cl();
      requester_o.GET_px(path_s)
      .then (result_spl => {
            result_array[0] = JSON.parse(result_spl);
            //this.doRender_p(JSON.parse(result_spl));

      })
      .catch (error_opl => {
         alert("fetch-error (get)");
      });
      requester_o.GET_px("/Weiterbildung/")
      .then (result_spl => {
            result_array[1] = JSON.parse(result_spl);

            this.doRender_p(result_array);


      })
      .catch (error_opl => {
         alert("fetch-error (get)");
      });
   }
   async doRender_p (data_opl) {
      if (data_opl[0] != null) {
         let markup_s = APPUTIL.tm_o.execute_px(this.template_s, data_opl);
         let el_o = document.querySelector(this.el_s);
         if (el_o != null) {
            el_o.innerHTML = markup_s;
            this.configHandleEvent_p();
            select_Weiter(data_opl[1]);
            window.addEventListener("click", function (event) {

            }, true);
         }
      }
   }
   close_px () {
      this.exitHandler_p();
   }

   exitHandler_p () {
      // Ereignisverarbeitung für das Formular aufheben
      const Speichern = document.getElementById('SpeichernWeiter');
      const Stornieren = document.getElementById('StornierenWeiter');

      if(Speichern != null){
         Speichern.removeEventListener("click", this.handleSubmit_p.bind(this, "Speichern"));

      }
      if(Stornieren != null){
         Stornieren.removeEventListener("click", this.handleSubmit_p.bind(this, "Stornieren"));
      }

   }
   configHandleEvent_p () {
      const Speichern = document.getElementById('SpeichernWeiter');
      const Stornieren = document.getElementById('StornierenWeiter');

      if(Stornieren != null){
         Stornieren.addEventListener("click", this.handleStorno_p.bind(this));
      }
      if(Speichern != null){
         Speichern.addEventListener("click", this.handleSubmit_p.bind(this));

      }

   }
   handleSubmit_p (event_opl, formtype){
      let form_o = document.getElementById("idForm3");

      if (form_o != null) {
         let fd_o = this.getFormData_px(form_o);


         let result_o = {};
         if (Mit_table_id != null) {                 // Id bereits vorhanden?

            this.saveOldData_p(fd_o)             // Aktualisierung bestehender Daten
            .then((result_opl) => { result_o = result_opl; });

         }
         if ("error" in result_o) {
            alert("Fehler beim Speichern der Daten aufgetreten");
         } else {

            let id_s = fd_o["id_spa"]; // mit Pfad "bestellungen/"
            let el_o = document.getElementById("id_spa");
            el_o.value = id_s;                         // Id der neuen Daten wird vermerkt
            this.render_px();
            alert("Gespeichert!");

         }
      }
      // keine Standard-Formularverarbeitung
      event_opl.preventDefault();
      event_opl.stopPropagation();
   }
   handleStorno_p (event_opl, formtype){
      let form_o = null;
      if(Weiter_table_id != null){
         form_o = document.getElementById(Weiter_table_id + "_form");
      }
      else{
         alert("Wählen sie einen Eintrag zum stornieren aus!")
      }


      if (form_o != null) {
         let fd_o = this.getFormData_px(form_o);


         let result_o = {};
         if (Mit_table_id != null) {                 // Id bereits vorhanden?

            this.saveOldData_p(fd_o)             // Aktualisierung bestehender Daten
            .then((result_opl) => { result_o = result_opl; });

         }
         if ("error" in result_o) {
            alert("Fehler beim Speichern der Daten aufgetreten");
         } else {

            let id_s = fd_o["id_spa"]; // mit Pfad "bestellungen/"
            let el_o = document.getElementById("id_spa");
            el_o.value = id_s;                         // Id der neuen Daten wird vermerkt
            alert("Gespeichert!");
            this.render_px();
         }
      }
      // keine Standard-Formularverarbeitung
      event_opl.preventDefault();
      event_opl.stopPropagation();
   }

   async saveOldData_p (data_opl) {

      let path_s = "/Mitarbeiter/" + Mit_table_id;
      let result_o = await APPUTIL.requester_o.PUT_px(path_s, data_opl);
      console.log(JSON.stringify(result_o));
      return result_o;

   }
   getFormData_px (form_opl) {
      let data_o = null;
      // auf die einzelnen Formularfelder und -werte zugreifen und als String ablegen
      let formData_o = new FormData(form_opl);
      let id_weiter_spa = [];
      let i = 0;
      data_o = {};

      for(let pair_a of formData_o.entries()) {
         if(pair_a[0] === "id_weiter_spa" && pair_a[1] !== "key_weiter"){
            id_weiter_spa[i] = pair_a[1];
            i++;
         }
      }
      formData_o.delete("id_weiter_spa");


      for(let pair_a of formData_o.entries()) {
         console.log(pair_a)
         data_o[pair_a[0]] = pair_a[1];
      }
      data_o["id_weiter_spa"] = id_weiter_spa
      return data_o;
   }
}
//------------------------------------------------------------------------------
class SichtWeiter_o {
//------------------------------------------------------------------------------

   constructor (el_spl, template_spl) {
      this.el_s = el_spl;
      this.template_s = template_spl;
      this.configHandleEvent_p();
   }
   render_px (data_opl) {
       // Daten anfordern
      let path_s = "/Weiterbildung/";
      let requester_o = new APPUTIL.Requester_cl();
      requester_o.GET_px(path_s)
      .then (result_spl => {
            this.doRender_p(JSON.parse(result_spl));
      })
      .catch (error_opl => {
         alert("fetch-error (get)");
      });
   }
   doRender_p (data_opl) {
      let markup_s = APPUTIL.tm_o.execute_px(this.template_s, data_opl);
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.innerHTML = markup_s;
      }
   }
   close_px () {
      this.exitHandler_p();
   }

   exitHandler_p () {
      // Ereignisverarbeitung für das Formular aufheben
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.removeEventListener("click", this.handleEvent_p);
      }
   }
   configHandleEvent_p () {
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.addEventListener("click", this.handleEvent_p);
      }
   }
   handleEvent_p (event_opl) {
      let cmd_s = event_opl.target.dataset.action;
      APPUTIL.es_o.publish_px("app.cmd", [cmd_s, null]);
   }
}

class SichtWeiterForm_o {
//------------------------------------------------------------------------------

   constructor (el_spl, template_spl) {
      this.el_s = el_spl;
      this.template_s = template_spl;

   }
   async render_px (data_opl) {
       // Daten anfordern
      let result_array = [];
      let path_s = "/Weiterbildung/" + Weiter_table_id;
      let requester_o = new APPUTIL.Requester_cl();
      requester_o.GET_px(path_s)
      .then (result_spl => {
            result_array[0] = JSON.parse(result_spl);
            //this.doRender_p(JSON.parse(result_spl));

      })
      .catch (error_opl => {
         alert("fetch-error (get)");
      });
      requester_o.GET_px("/Mitarbeiter/")
      .then (result_spl => {
            result_array[1] = JSON.parse(result_spl);

            this.doRender_p(result_array);


      })
      .catch (error_opl => {
         alert("fetch-error (get)");
      });
   }
   async doRender_p (data_opl) {
      if (data_opl[0] != null) {
         let markup_s = APPUTIL.tm_o.execute_px(this.template_s, data_opl);
         let el_o = document.querySelector(this.el_s);
         if (el_o != null) {
            el_o.innerHTML = markup_s;
            this.configHandleEvent_p();
            window.addEventListener("click", function (event) {

            }, true);
         }
      }
   }
   close_px () {
      this.exitHandler_p();
   }

   exitHandler_p () {
      // Ereignisverarbeitung für das Formular aufheben
      const submit = document.getElementById('StatusSpeichern');


      if(submit != null){
         submit.removeEventListener("click", this.handleSubmit_p.bind(this));
      }

   }
   configHandleEvent_p () {
      const submit = document.getElementById('StatusSpeichern');


      if(submit != null){
         submit.addEventListener("click", this.handleSubmit_p.bind(this));
      }

   }
   handleSubmit_p (event_opl){
      let form_o = document.getElementById(Mit_table_id + "_form");
      if (form_o != null) {
         let fd_o = this.getFormData_px(form_o);


         let result_o = {};
         if (Mit_table_id != null) {                 // Id bereits vorhanden?

            this.saveOldData_p(fd_o)             // Aktualisierung bestehender Daten
            .then((result_opl) => { result_o = result_opl; });

         }
         if ("error" in result_o) {
            alert("Fehler beim Speichern der Daten aufgetreten");
         } else {

            let id_s = fd_o["id_spa"]; // mit Pfad "bestellungen/"
            let el_o = document.getElementById("id_spa");
            el_o.value = id_s;                         // Id der neuen Daten wird vermerkt
            alert("Gespeichert!");

         }
      }
      // keine Standard-Formularverarbeitung
      event_opl.preventDefault();
      event_opl.stopPropagation();
   }

   async saveOldData_p (data_opl) {

      let path_s = "/Mitarbeiter/" + Mit_table_id;
      let result_o = await APPUTIL.requester_o.PUT_px(path_s, data_opl);
      console.log(JSON.stringify(result_o));
      await this.render_px();
      return result_o;

   }
   getFormData_px (form_opl) {
      let data_o = null;
      // auf die einzelnen Formularfelder und -werte zugreifen und als String ablegen
      let formData_o = new FormData(form_opl);
      data_o = {};
      for(let pair_a of formData_o.entries()) {
         data_o[pair_a[0]] = pair_a[1];
      }
      data_o["status_spa"] = document.getElementById(Mit_table_id + "_status").value;
      return data_o;
   }
}
//------------------------------------------------------------------------------
class Mitarbeiter_o {
//------------------------------------------------------------------------------

   constructor (el_spl, template_spl) {
      this.el_s = el_spl;
      this.template_s = template_spl;
      this.configHandleEvent_p();
   }
  render_px (data_opl) {
       // Daten anfordern
      let path_s = "/Mitarbeiter/";
      let requester_o = new APPUTIL.Requester_cl();
      requester_o.GET_px(path_s)
      .then (result_spl => {

            this.doRender_p(JSON.parse(result_spl));

      })
      .catch (error_opl => {
         alert("fetch-error (get)");
      });

   }

   doRender_p (data_opl) {
      let markup_s = APPUTIL.tm_o.execute_px(this.template_s, data_opl);
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.innerHTML = markup_s;
         sortTable();
      }
   }
   close_px () {
      this.exitHandler_p();
   }

   exitHandler_p () {
      // Ereignisverarbeitung für das Formular aufheben
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.removeEventListener("click", this.handleEvent_p);
      }
   }
   configHandleEvent_p () {
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.addEventListener("click", this.handleEvent_p);
      }
   }
   handleEvent_p (event_opl) {
      let cmd_s = event_opl.target.dataset.action;
      APPUTIL.es_o.publish_px("app.cmd", [cmd_s, null]);
   }
}
//------------------------------------------------------------------------------
class Weiterbildung_o {
//------------------------------------------------------------------------------

   constructor (el_spl, template_spl) {
      this.el_s = el_spl;
      this.template_s = template_spl;
      this.configHandleEvent_p();
   }
   render_px (data_opl) {
       // Daten anfordern
      let result_array = [];
      let path_s = "/Mitarbeiter/";
      let requester_o = new APPUTIL.Requester_cl();
      requester_o.GET_px(path_s)
      .then (result_spl => {
            result_array[0] = JSON.parse(result_spl);
            //this.doRender_p(JSON.parse(result_spl));

      })
      .catch (error_opl => {
         alert("fetch-error (get)");
      });
      requester_o.GET_px("/Weiterbildung/")
      .then (result_spl => {
            result_array[1] = JSON.parse(result_spl);
            this.doRender_p(result_array);

      })
      .catch (error_opl => {
         alert("fetch-error (get)");
      });

   }

   doRender_p (data_opl) {
      let markup_s = APPUTIL.tm_o.execute_px(this.template_s, data_opl);
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.innerHTML = markup_s;
         sortTable();
      }
   }
   close_px () {
      this.exitHandler_p();
   }

   exitHandler_p () {
      // Ereignisverarbeitung für das Formular aufheben
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.removeEventListener("click", this.handleEvent_p);
      }
   }
   configHandleEvent_p () {
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.addEventListener("click", this.handleEvent_p);
      }
   }
   handleEvent_p (event_opl) {
      let cmd_s = event_opl.target.dataset.action;
      APPUTIL.es_o.publish_px("app.cmd", [cmd_s, null]);
   }
}
//------------------------------------------------------------------------------
class Zertifikate_o {
//------------------------------------------------------------------------------

   constructor (el_spl, template_spl) {
      this.el_s = el_spl;
      this.template_s = template_spl;
      this.configHandleEvent_p();
   }
   render_px (data_opl) {
       // Daten anfordern
      let path_s = "/Mitarbeiter/";
      let requester_o = new APPUTIL.Requester_cl();
      requester_o.GET_px(path_s)
      .then (result_spl => {
            this.doRender_p(JSON.parse(result_spl));
      })
      .catch (error_opl => {
         alert("fetch-error (get)");
      });
   }
   doRender_p (data_opl) {
      let markup_s = APPUTIL.tm_o.execute_px(this.template_s, data_opl);
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.innerHTML = markup_s;
         sortTable();
      }
   }
   close_px () {
      this.exitHandler_p();
   }

   exitHandler_p () {
      // Ereignisverarbeitung für das Formular aufheben
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.removeEventListener("click", this.handleEvent_p);
      }
   }
   configHandleEvent_p () {
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.addEventListener("click", this.handleEvent_p);
      }
   }
   handleEvent_p (event_opl) {
      let cmd_s = event_opl.target.dataset.action;
      APPUTIL.es_o.publish_px("app.cmd", [cmd_s, null]);
   }
}

//------------------------------------------------------------------------------
class SideBar_cl {
//------------------------------------------------------------------------------

   constructor (el_spl, template_spl) {
      this.el_s = el_spl;
      this.template_s = template_spl;
      this.configHandleEvent_p();
   }
   render_px (data_opl) {
      let markup_s = APPUTIL.tm_o.execute_px(this.template_s, data_opl);
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.innerHTML = markup_s;
      }
   }
   configHandleEvent_p () {
      let el_o = document.querySelector(this.el_s);
      if (el_o != null) {
         el_o.addEventListener("click", this.handleEvent_p);
      }
   }
   handleEvent_p (event_opl) {
      let cmd_s = event_opl.target.dataset.action;
      APPUTIL.es_o.publish_px("app.cmd", [cmd_s, null]);
   }
}

class Application_cl {

   constructor () {
      // Registrieren zum Empfang von Nachrichten
      APPUTIL.es_o.subscribe_px(this, "templates.loaded");
      APPUTIL.es_o.subscribe_px(this, "templates.failed");
      APPUTIL.es_o.subscribe_px(this, "app.cmd");
      this.sideBar_o = new SideBar_cl("aside", "Navigation.mako");
      this.Startseite_o = new Startseite_cl("main", "Startseite.mako");
      this.PflegeMit_o = new PflegeMit_o("main", "Pflege_Mit.mako");
      this.PflegeMitDetail_o = new PflegeMitDetail_o("main", "Pflege_Mit_Detail.mako");
      this.MitarbeiterForm_o = new MitarbeiterForm_o("main", "Mitarbeiter_form.mako");
      this.PflegeWeiter_o = new PflegeWeiter_o("main", "Pflege_Weiter.mako");
      this.PflegeWeiterDetail_o = new PflegeWeiterDetail_o("main", "Pflege_Weiter_Detail.mako");
      this.WeiterbildungForm_o = new WeiterbildungForm_o("main","Weiterbildung_form.mako")
      this.SichtMit_o = new SichtMit_o("main", "Sichtweise_Mit.mako");
      this.SichtMitForm_o = new SichtMitForm_o("main", "Sichtweise_Mit_Form.mako");
      this.SichtWeiter_o = new SichtWeiter_o("main", "Sichtweise_Weiter.mako");
      this.SichtWeiterForm_o = new SichtWeiterForm_o("main", "Sichtweise_Weiter_form.mako");
      this.Mitarbeiter_o = new Mitarbeiter_o("main", "Mitarbeiter.mako");
      this.Weiterbildung_o = new Weiterbildung_o("main", "Weiterbildungen.mako");
      this.Zertifikate_o = new Zertifikate_o("main", "Zertifikate.mako");
   }
   notify_px (self, message_spl, data_opl) {
      switch (message_spl) {
      case "templates.failed":
         alert("Vorlagen konnten nicht geladen werden.");
         break;
      case "templates.loaded":
         // Templates stehen zur Verfügung, Bereiche mit Inhalten füllen
         // hier zur Vereinfachung direkt

         let nav_a = [
            ["Start", "Startseite"],
            ["PflegeMit", "Pflege_Mit"],
            ["PflegeMitDetail", "Pflege_Mit_Detail"],
            ["MitarbeiterForm", "Mitarbeiter_form"],
            ["MitarbeiterFormEdit", "Mitarbeiter_form_Edit"],
            ["MitarbeiterFormDelete", "Mitarbeiter_form_Delete"],
            ["MitarbeiterDetailFormDelete", "Mitarbeiter_Detail_form_Edit"],
            ["PflegeWeiter", "Pflege_Weiter"],
            ["PflegeWeiterDetail", "Pflege_Weiter_Detail"],
            ["WeiterbildungForm", "Weiterbildung_form"],
            ["WeiterbildungFormEdit", "Weiterbildung_form_Edit"],
            ["WeiterbildungFormDelete", "Weiterbildung_form_Delete"],
            ["WeiterbildungDetailFormDelete", "Weiterbildung_Detail_form_Delete"],
            ["SichtMit", "Sicht_Mit"],
            ["SichtMitForm", "Sicht_Mit_Form"],
            ["SichtWeiter", "Sicht_Weiter"],
            ["SichtWeiterForm", "Sicht_Weiter_Form"],
            ["Mit", "Mitarbeiter"],
            ["Weiter", "Weiterbildung"],
            ["Zerti", "Zertifikate"]

         ];
         self.sideBar_o.render_px(nav_a);

         self.Startseite_o.render_px();
         self.Startseite_o.close_px();
         break;

      case "app.cmd":
         // hier müsste man überprüfen, ob der Inhalt gewechselt werden darf
         switch (data_opl[0]) {
         case "Start":
            this.Startseite_o.render_px();
            this.Startseite_o.close_px();
            break;
         case "PflegeMit":
            // Daten anfordern und darstellen
            this.PflegeMit_o.render_px();
            this.PflegeMit_o.close_px();
            break;
         case "PflegeMitDetail":
            this.PflegeMitDetail_o.render_px();
            this.PflegeMitDetail_o.close_px();
            break;
         case "MitarbeiterForm":
            this.MitarbeiterForm_o.render_px(data_opl[0]);
            this.MitarbeiterForm_o.close_px();
            break;
         case "MitarbeiterFormEdit":
            this.MitarbeiterForm_o.render_px();
            this.MitarbeiterForm_o.close_px();
            break;
         case "MitarbeiterFormDelete":
            if(Mit_table_id != null){
               this.PflegeMit_o.render_px(data_opl[0])
               this.PflegeMit_o.close_px();
            }

            break;
         case "MitarbeiterDetailFormDelete":
            if(Mit_table_id != null){
               this.PflegeMitDetail_o.render_px(data_opl[0])
               this.PflegeMitDetail_o.close_px();
            }

            break;
         case "PflegeWeiter":
            this.PflegeWeiter_o.render_px();
            this.PflegeWeiter_o.close_px();
            break;
         case "PflegeWeiterDetail":
            this.PflegeWeiterDetail_o.render_px();
            this.PflegeWeiterDetail_o.close_px();
            break;
         case "WeiterbildungForm":
            this.WeiterbildungForm_o.render_px(data_opl[0]);
            this.WeiterbildungForm_o.close_px();
            break;
         case "WeiterbildungFormEdit":
            this.WeiterbildungForm_o.render_px();
            this.WeiterbildungForm_o.close_px();
            break;
         case "WeiterbildungFormDelete":
            if(Weiter_table_id != null){
               this.PflegeWeiter_o.render_px(data_opl[0])
               this.PflegeWeiter_o.close_px();
            }
            break;
         case "WeiterbildungDetailFormDelete":
            if(Weiter_table_id != null){
               this.PflegeWeiterDetail_o.render_px(data_opl[0])
               this.PflegeWeiterDetail_o.close_px();
            }
            break;
         case "SichtMit":
            this.SichtMit_o.render_px();
            this.SichtMit_o.close_px();
            break;
         case "SichtMitForm":
            if(Mit_table_id != null){
               this.SichtMitForm_o.render_px();
               this.SichtMitForm_o.close_px();
            }
            else{
               alert("Wählen sie einen Mitarbeiter aus!")
            }
            break;

         case "SichtWeiter":
            this.SichtWeiter_o.render_px();
            this.SichtWeiter_o.close_px();
            break;
         case "SichtWeiterForm":
            if(Weiter_table_id != null){
               this.SichtWeiterForm_o.render_px();
               this.SichtWeiterForm_o.close_px();
            }
            else{
               alert("Wählen sie eine Weiterbildung aus!")
            }

            break;
         case "Mit":
            this.Mitarbeiter_o.render_px();
            this.Mitarbeiter_o.close_px();
            break;
         case "Weiter":
            this.Weiterbildung_o.render_px();
            this.Weiterbildung_o.close_px();
            break;
         case "Zerti":
            this.Zertifikate_o.render_px();
            this.Weiterbildung_o.close_px();
            break;
         case "idBack":
            APPUTIL.es_o.publish_px("app.cmd", ["Start", null]);
            break;
         }
         break;
      }
   }
}

function addInput(){

        var div = document.getElementById('inputs_div');
        var clone = div.cloneNode(true);

        document.getElementById('inputs_container').appendChild(clone);


}


function select_Weiter(data) {

                console.log(data)
                var p = document.getElementById('create_check');

                var i = 0;

                for (var prop in data) {
                    var checkbox = document.createElement('input');


                       /* if (data[prop].status === "None"){
                            data[prop].status = "angemeldet"
                        }*/



                            var key_weiter_str = JSON.stringify(prop);

                            checkbox.type = "checkbox";
                            checkbox.id = "id_weiter_spa";
                            checkbox.name = "id_weiter_spa";
                            checkbox.value = key_weiter_str;


                            var label = document.createElement('label');
                            var tn = document.createTextNode(JSON.stringify(data[prop]["bezeichnung"]));
                            label.htmlFor = "cbid";
                            label.appendChild(tn);
                            p.appendChild(label);
                            p.appendChild(checkbox);



                        i++;


     }
 }
 function stringifyFormData_px(formData_opl) {
   var d_o = {};
   var pair_o;
   var key_o;
   // alle Werte, auch einzelne, werden als Arrays geliefert!
   for(key_o of formData_opl.keys()) {
      d_o[key_o] = formData_opl.getAll(key_o);
   }
   return JSON.stringify(d_o);
}

function getTableID(clicked_ID,form){
   if(form === "Mitarbeiter"){
      Mit_table_id = clicked_ID;

   }
   else if(form === "Weiterbildung"){
      Weiter_table_id = clicked_ID
   }

}

function sortTable() {
  var table, rows, switching, i, x, y, shouldSwitch;
  table = document.getElementById("Mitarbeitertabelle");
  if (table == null){
      return;
  }
  switching = true;


  while (switching) {

    switching = false;
    rows = table.rows;

    for (i = 1; i < (rows.length - 1); i++) {

      shouldSwitch = false;

      x = rows[i].getElementsByTagName("TD")[0];
      y = rows[i + 1].getElementsByTagName("TD")[0];

      if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {

        shouldSwitch = true;
        break;
      }
    }
    if (shouldSwitch) {

      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
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

window.onload = function () {
   APPUTIL.es_o = new APPUTIL.EventService_cl();
   APPUTIL.requester_o = new APPUTIL.Requester_cl();
   var app_o = new Application_cl();
   APPUTIL.createTemplateManager_px();
}