<main class="selektor_Mit_form">
    <form id="idForm">
            @let Weiterbildung_spa = [];@
            @for key_weiter in context["Weiterbildung"]@
                <input type="hidden" value="#key_weiter#" id="Weiterbildung_spa" name="Weiterbildung_spa" />
            @endfor@


            <input type="hidden" value="" id="id_spa" name="id_spa" />

    <div class="">
        <div class="">
            <label for="name_spa">Name</label>
            <input type="text" value="#context["name"]#" id="name_spa" name="name_spa" required />
        </div>
        <div class="">
            <label for="vorname_spa">Vorname</label>
            <input type="text" value="#context["vorname"]#" id="vorname_spa" name="vorname_spa" required />
        </div>
        <div class="">
            <label for="ak_grad_spa">Akademischer Grad</label>
            <input type="text" value="#context["akademischer_grad"]#" id="ak_grad_spa" name="ak_grad_spa" required />
        </div>
        <div class="">
            <label for="taetigkeit_spa">Tätigkeit</label>
            <input type="text" value="#context["taetigkeit"]#" id="taetigkeit_spa" name="taetigkeit_spa" required />
        </div>


        <div>

            <input type="submit" value="Speichern" class=""/>
        </div>
    </div>

    </form>
        <div class="abbrechenDiv">

            <a href=## data-action="PflegeMit" role="button">Abbrechen</a>

        </div>
</main>