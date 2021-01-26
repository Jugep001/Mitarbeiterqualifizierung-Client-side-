<div class="item7">
            
            @for key_s in context@

                    <div>
                        <a href="/add?data=${key_s}&listForm=Sichtweise_Mit_Form" role="button">#context[key_s]["vorname"]#</a>
                    </div>



            @endfor@
</div>
