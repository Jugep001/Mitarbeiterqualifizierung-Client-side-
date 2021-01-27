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
      requester_o.GET_px(path_s)
      .then (result_spl => {
            console.log(result_spl)
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
   }
   async render_px (data_opl) {
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
         this.configHandleEvent_p();
      }
   }
   configHandleEvent_p () {
      const form = document.getElementById('idForm');

         form.addEventListener("submit", this.handleSubmit_p.bind(this));




   }
   handleSubmit_p (event_opl) {
      let form_o = document.querySelector("form");
      if (form_o != null) {
         let fd_o = this.getFormData_px(form_o);
         console.log(fd_o["id_spa"])

         let result_o = {};
         if (Mit_table_id == "") {                 // Id bereits vorhanden?
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
    render_px (data_opl) {
       // Daten anfordern
      let result_array = [];
      let path_s = "/Weiterbildung/";
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
   doRender_p (data_opl) {
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
   configHandleEvent_p () {
      const form = document.getElementById('idForm2');

         form.addEventListener("submit", this.handleSubmit_p.bind(this));




   }
   handleSubmit_p (event_opl) {
      let form_o = document.querySelector("form");
      if (form_o != null) {
         let fd_o = this.getFormData_px(form_o);


         let result_o = {};
         if (Weiter_table_id == "") {                 // Id bereits vorhanden?
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
      this.MitarbeiterForm_o = new MitarbeiterForm_o("main", "Mitarbeiter_form.mako")
      this.PflegeWeiter_o = new PflegeWeiter_o("main", "Pflege_Weiter.mako");
      this.PflegeWeiterDetail_o = new PflegeWeiterDetail_o("main", "Pflege_Weiter_Detail.mako");
      this.WeiterbildungForm_o = new WeiterbildungForm_o("main","Weiterbildung_form.mako")
      this.SichtMit_o = new SichtMit_o("main", "Sichtweise_Mit.mako");
      this.SichtWeiter_o = new SichtWeiter_o("main", "Sichtweise_Weiter.mako");
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
         let markup_s;
         let el_o;
         markup_s = APPUTIL.tm_o.execute_px("Startseite.mako", null);
         el_o = document.querySelector("header");
         if (el_o != null) {
            el_o.innerHTML = markup_s;
         }
         let nav_a = [
            ["Start", "Startseite"],
            ["PflegeMit", "Pflege_Mit"],
            ["PflegeMitDetail", "Pflege_Mit_Detail"],
            ["MitarbeiterForm", "Mitarbeiter_form"],
            ["MitarbeiterFormEdit", "Mitarbeiter_form_Edit"],
            ["PflegeWeiter", "Pflege_Weiter"],
            ["PflegeWeiterDetail", "Pflege_Weiter_Detail"],
            ["WeiterbildungForm", "Weiterbildung_form"],
            ["WeiterbildungFormEdit", "Weiterbildung_form_Edit"],
            ["SichtMit", "Sicht_Mit"],
            ["SichtWeiter", "Sicht_Weiter"],
            ["Mit", "Mitarbeiter"],
            ["Weiter", "Weiterbildung"],
            ["Zerti", "Zertifikate"]

         ];
         self.sideBar_o.render_px(nav_a);
         markup_s = APPUTIL.tm_o.execute_px("Startseite.mako", null);
         el_o = document.querySelector("main");
         if (el_o != null) {
            el_o.innerHTML = markup_s;
         }
         break;

      case "app.cmd":
         // hier müsste man überprüfen, ob der Inhalt gewechselt werden darf
         switch (data_opl[0]) {
         case "Start":
            this.Startseite_o.render_px();
            break;
         case "PflegeMit":
            // Daten anfordern und darstellen
            this.PflegeMit_o.render_px();
            break;
         case "PflegeMitDetail":
            this.PflegeMitDetail_o.render_px();
            break;
         case "MitarbeiterForm":
            this.MitarbeiterForm_o.render_px(data_opl[0]);
            break;
         case "MitarbeiterFormEdit":
            this.MitarbeiterForm_o.render_px();
            break;
         case "PflegeWeiter":
            this.PflegeWeiter_o.render_px();
            break;
         case "PflegeWeiterDetail":
            this.PflegeWeiterDetail_o.render_px();
            break;
         case "WeiterbildungForm":
            this.WeiterbildungForm_o.render_px(data_opl[0]);
            break;
         case "WeiterbildungFormEdit":
            this.WeiterbildungForm_o.render_px();
            break;
         case "SichtMit":
            this.SichtMit_o.render_px();
            break;
         case "SichtWeiter":
            this.SichtWeiter_o.render_px();
            break;
         case "Mit":
            this.Mitarbeiter_o.render_px();
            break;
         case "Weiter":
            this.Weiterbildung_o.render_px();
            break;
         case "Zerti":
            this.Zertifikate_o.render_px();
            break;
         case "idBack":
            APPUTIL.es_o.publish_px("app.cmd", ["Start", null]);
            break;
         }
         break;
      }
   }
}
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

window.onload = function () {
   APPUTIL.es_o = new APPUTIL.EventService_cl();
   APPUTIL.requester_o = new APPUTIL.Requester_cl();
   var app_o = new Application_cl();
   APPUTIL.createTemplateManager_px();
   let body_o = document.getElementsByTagName('body')[0];
   body_o.addEventListener('click', confirmDelete_p, false);
}