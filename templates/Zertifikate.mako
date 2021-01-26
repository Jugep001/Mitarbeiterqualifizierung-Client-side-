<div class="item7">
            <table id="Mitarbeitertabelle">
                <tr>
                    <th>Name des Mitarbeiters</th>
                    <th>Bezeichnung des Zertifikats</th>
                </tr>
             @for key_s in context@

                         @if context[key_s]["Weiterbildung"]@


                            @for key_weiter in context[key_s]["Weiterbildung"]@

                                    @if context[key_s]["Weiterbildung"][key_weiter]["status"] == "erfolgreich beendet"@
                                        <tr>
                                            <td>#context[key_s]["name"]#</td>
                                            <td>#context[key_s]["Weiterbildung"][key_weiter]["bezeichnung_zerti"]#</td>
                                        </tr>
                                    @endif@
                            @endfor@

                         @endif@

            @endfor@
            </table>
</div>
