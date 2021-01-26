<div class="item7">
            @for key_s in context@
                <ul class="">
                    <li>
                        <a href="/add?data=${key_s}&listForm=Sichtweise_Weiter_form" role="button">Weiterbildung(Name):#context[key_s]["bezeichnung"]#</a>
                     </li>
                </ul>


            @endfor@
</div>

