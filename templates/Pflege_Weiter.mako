<div class="item7">
            <ul>



        @for key_s in context@
        <div>
                    <div>
                        <a href="/edit?id_spl=${key_s}" role="button"> bearbeiten </a>
                        <a href="/delete/${key_s}" class='clDelete' role="button"> löschen</a>
                    </div>

                    <ul class="">

                            <li>bezeichnung:#context[key_s]["bezeichnung"]#</li>
                            <li>von:#context[key_s]["von"]#</li>
                            <li>bis:#context[key_s]["bis"]#</li>
                            <li>beschreibung:#context[key_s]["beschreibung"]#</li>
                            <li>max_teilnehmer:#context[key_s]["min_teilnehmer"]#</li>
                            <li>min_teilnehmer:#context[key_s]["max_teilnehmer"]#</li>

                    </ul>


        </div>
        @endfor@
    </ul>
            <div>
                <a href=## data-action="WeiterbildungForm"  role="button">erfassen</a>
                <a href="##" data-action="PflegeWeiterDetail" role="button">anzeigen</a>
            </div>
</div>
