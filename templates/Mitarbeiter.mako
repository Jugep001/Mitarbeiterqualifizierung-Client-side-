<div class="item7">
        <table id="Mitarbeitertabelle">
            <tr>
                            <th><b>Name</b></th>
                            <th>Vorname</th>
                            <th>Akademischer Grad</th>
                            <th>Tätigkeit</th>
                            <th>Weiterbildung(bezeichnung)</th>
                            <th>von</th>
                            <th>bis</th>
                            <th>Weiterbildung(status)</th>
            </tr>


        @for key_s in context@


                            @if context[key_s]["Weiterbildung"] == undefined@

                                <tr>

                                    <td>#context[key_s]["name"]#</td>
                                    <td>#context[key_s]["vorname"]#</td>
                                    <td>#context[key_s]["akademischer_grad"]#</td>
                                    <td>#context[key_s]["taetigkeit"]#</td>

                                </tr>
                            @endif@

                            @if context[key_s]["Weiterbildung"]@


                                        @for key_weiter_s in context[key_s]["Weiterbildung"]@
                                            <tr>
                                                <td>#context[key_s]["name"]#</td>
                                                <td>#context[key_s]["vorname"]#</td>
                                                <td>#context[key_s]["akademischer_grad"]#</td>
                                                <td>#context[key_s]["taetigkeit"]#</td>
                                                <td>#context[key_s]["Weiterbildung"][key_weiter_s]["bezeichnung"]#</td>
                                                <td>#context[key_s]["Weiterbildung"][key_weiter_s]["von"]#</td>
                                                <td>#context[key_s]["Weiterbildung"][key_weiter_s]["bis"]#</td>
                                                <td>#context[key_s]["Weiterbildung"][key_weiter_s]["status"]#</td>
                                            </tr>
                                        @endfor@



                            @endif@






        @endfor@

        </table>
</div>
