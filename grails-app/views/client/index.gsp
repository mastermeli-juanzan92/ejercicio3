<%--
  Created by IntelliJ IDEA.
  User: jberesiarte
  Date: 2019-04-26
  Time: 09:30
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Ejercicio 3 - Grails</title>
    <meta name="layout" content="main"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <link href="https://fonts.googleapis.com/css?family=Nunito:200,300" rel="stylesheet">
    <asset:link rel="icon" href="faviconMELI.ico" type="image/x-ico"/>
    <asset:stylesheet src="index.css"/>
    <g:javascript library="prototype"/>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">

    <script type="text/javascript">

        function validadorBootstrap() {
            'use strict';
            window.addEventListener('load', function () {
                // Fetch all the forms we want to apply custom Bootstrap validation styles to
                var forms = document.getElementsByClassName('needs-validation');
                // Loop over them and prevent submission
                var validation = Array.prototype.filter.call(forms, function (form) {
                    form.addEventListener('submit', function (event) {
                        if (form.checkValidity() === false) {
                            event.preventDefault();
                            event.stopPropagation();
                        }
                        form.classList.add('was-validated');
                    }, false);
                });
            }, false);
        };


    </script>


    <script type="application/javascript">
        function buscarAgencies() {
            var dat = $('#myForm').serializeArray()
            $.ajax({
                type: "GET",
                dataType: "json",
                url: "/Client/getAgencies",
                data: $("#myForm").serializeArray(),
                success: function (response) {
                    console.log(response)
                    $('#agencies_list').append('<h2>Lista de Agencias </h2>')
                    $.each(response, function (i, agencia) {
                        $agencia = $('<a>', {
                            id: agencia.agency_code,
                            text: agencia.description,
                            class: "list-group-agencia",
                            href: "#"
                        });
                        $agencia.append($('<i>', {
                            style: "font-size:32px; margin-left: 10px",
                            class: "fa fa-thumbs-down pull-right"
                        }));
                        $agencia.append($('<i>', {
                            style: "font-size:32px;",
                            class: "fa fa-thumbs-up pull-right"
                        }));
                        $('#agencies_list').append($agencia);
                    });
                }
            });
        }

    </script>
</head>

<style>

</style>


<body>

<div class="col-md-4 mb-3 md-form">
    <h2>Busqueda de Agencias</h2>

    <form class="form-group" name="myForm" id="myForm" novalidate class="needs-validation">

        <div class="form-group">
            <label for="longitud">Longitud</label>
            <input type="number" class="form-control" name="longitud" min="-180" max="180" id="longitud"
                   placeholder="ingrese una Longitud" required value="-64.18758">

            <div class="invalid-feedback">
                Debe ingresar Longitud
            </div>
        </div>

        <div class="form-group">
            <label for="latitud">Longitud</label>
            <input type="number" class="form-control" name="latitud" id="latitud" min="-90" max="90"
                   placeholder="ingrese una Latitud" value="-31.412971" required>

            <div class="invalid-feedback">
                Debe ingresar Latitud
            </div>
        </div>

        <div class="form-group">
            <label for="radio">Radio</label>
            <input type="number" class="form-control" name="radio" id="radio" min="0" max="1000"
                   placeholder="ingrese una Latitud" value="300" required>

            <div class="invalid-feedback">
                Debe ingresar Latitud
            </div>
        </div>

        <div class="form-group">
            <label for="site_id">ID Sitio</label>
            <input type="text" class="form-control" name="site_id" id="site_id" placeholder="ingrese un id del sitio"
                   value="MLA" required>

            <div class="invalid-feedback">
                Debe ingresar id
            </div>
        </div>

        <div class="form-group">
            <label for="payment_method">Metodo de Pago</label>
            <input type="text" class="form-control" name="payment_method" id="payment_method"
                   placeholder="ingrese un metodo de pago"
                   value="rapipago" required>

            <div class="invalid-feedback">
                Debe ingresar metodo de pago
            </div>
        </div>

        <div class="form-group">
            <label for="limit">Limite</label>
            <input type="text" class="form-control" name="limit" id="limit" placeholder="ingrese un limite" value="0">
        </div>

        <div class="form-group">
            <label for="off_set">Off Set</label>
            <input type="text" class="form-control" name="off_set" id="off_set" placeholder="ingrese el off set"
                   value="0">
        </div>

        <div class="form-group">
            <label for="criterio">Seleccione un Criterio de ordenamiento</label>
            <select class="form-control" id="criterio">
                <option>Distancia</option>
                <option>Address line</option>
                <option>Agency Code</option>
            </select>
        </div>

        <button class="btn btn-primary btn-sm btn-rounded" type="submit" onclick="buscarAgencies()">Buscar</button>

    </form>

</div>

<div class="container-fluid">

    <div class="list-group" id="agencies_list"></div>
</div>

</body>

</html>