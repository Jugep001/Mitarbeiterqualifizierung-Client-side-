<div class="item7">

        @for key_s in context@


        <div>
            <a href="/edit?id_spl=${key_s}">bearbeiten</a>
            <a href="/delete/${key_s}" class='clDelete'> löschen</a>

                    <ul class="">

                            <li>Name:#context[key_s]["name"]#</li>
                            <li>Vorname:#context[key_s]["vorname"]#</li>
                            <li>Akademischer Grad:#context[key_s]["akademischer_grad"]#</li>
                            <li>Tätigkeit:#context[key_s]["taetigkeit"]#</li>

                    </ul>


        </div>
        @endfor@

            <div>
                <a href="##" data-action="MitarbeiterForm" role="button">erfassen</a>
                <a href="##" data-action="PflegeMitDetail" role="button">anzeigen</a>
            </div>
</div>


