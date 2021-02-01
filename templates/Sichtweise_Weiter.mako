<div class="item7">
    <table>
            <tr>
                <th>Weiterbildung(Name)</th>
            </tr>
            @for key_s in context@
                <tr id="#key_s#" onclick="getTableID(this.id, 'Weiterbildung')">

                        <td>#context[key_s]["bezeichnung"]#</td>

                </tr>


            @endfor@

    </table>
            <div>
                <a href="##" data-action="SichtWeiterForm" role="button">anzeigen</a>
            </div>
</div>

