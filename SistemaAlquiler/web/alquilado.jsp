<%-- 
    Document   : listahabitaciones
    Created on : 03-jun-2014, 23:23:24
    Author     : Meli
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html>

    <head>
         <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.2/jquery.min.js"></script>
     <!--<script src="js/jquery-ui.js" type="text/javascript"></script>-->
          <script type="text/javascript" src="js/jquery.pajinate.js"></script>
        <link rel="stylesheet"  type="text/css" href="css/fullcalendar/fullcalendar.css" />
              <link rel='stylesheet' type='text/css' href="css/fullcalendar/fullcalendar.css" media='print' />

        <script src="js/fullcalendar/fullcalendar.year.js" type="text/javascript"></script>
        <script src="js/fullcalendar/fullcalendar.js" type="text/javascript"></script>
        <script src="js/habitaciones/cronograma_listar.js" type="text/javascript"></script>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=no">
        <meta name="description" content="">
        <meta name="author" content="">

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="css/freelancer.css" rel="stylesheet" type="text/css">

        <!-- Fonts -->
        <!--<link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">-->
        <link href='http://fonts.googleapis.com/css?family=Montserrat:400,700' rel='stylesheet' type='text/css'>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- Bootstrap -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>
        <div class="container-fluid fondoGris">
            <div class="row-fluid  div-titulo">
                <h3 class="span6">Registrar Habitación </h3>
                <div class="span6"> <a  href="listarAlumnos.html" class=" btn btn-info fa-input pull-right">Volver a Listado</a>   </div> 
            </div>
            <div class="row-fluid formulario">
                <form id="frmReghab" method="GET"  action="registroHabitacion"  class="form-horizontal">
                    <fieldset >


                    </fieldset>


                    <fieldset>

                        <legend></legend>    
                        <legend><h4>Sus datos han sido enviados al correo del arrendatario</h4></legend>
<div>
                            <div id='calendar' class=""></div>             
                        </div> 
                        <div class="row-fluid "> 
                            <div class="span12 form-actions">
                                <div class="control-group">
                                    <div class="controls">

                                        <a class="btn btn-info fa-input right" href="listahabitaciones.jsp">Regresar a lista</a>  
                                    </div> 
                                </div>

                            </div> 
                        </div>
                    </fieldset> 
                    <fieldset>
                        <h1>Cronograma de Horarios</h1> 
                        
                    </fieldset>
                </form>

            </div>
        </div>



    </body>
    <footer class="text-center">
        <div class="footer-below">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        Copyright &copy; 2014 - @Karla @Meli
                    </div>
                </div>
            </div>
        </div>
    </footer>
</html>
