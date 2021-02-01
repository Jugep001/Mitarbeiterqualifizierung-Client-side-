@let k = 0;@
@let i = 0;@
@let j = 0;@
                @for key_mit in context[0]@

                    @i = i + 1;@

                @endfor@
                @for key_weiter in context[1]@

                    @j = j + 1;@

                @endfor@
                @for key_s in context[0]@

                        @for key_weiter in context[0][key_s]["Weiterbildung"]@
                            @if context[0][key_s]["Weiterbildung"][key_weiter]["status"] == "nimmt teil"@
                                @k = k + 1;@
                            @endif@
                        @endfor@

                @endfor@

<div class="item7">

                    <p>Anzahl Mitarbeiter: #i#</p>
                    <p>Anzahl Weiterbildungen: #j#</p>
                    <p>Anzahl Teilnahmen: #k#</p>




</div>


