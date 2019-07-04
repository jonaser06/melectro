<?php
$base = basename($url2);
?>
<body>
    <div class="wall-products">
        <?php
        include 'tolbar.php';
        ?>
        <div class="contenido">
            <div class="prodcontent">
                <div class="headbar">
                    <div class="row roundstyle">
                        <div class="col-md-12 t-align">
                            <p style="display:inline;"><span class="fa fa-bar-chart"></span>| Reportes de Ventas</p>
                        </div>
                    </div>
                </div>
                <div class="bodybar">
                    <div class="row">   
                        <div class="col-md-12">
                            <div class="contentChart" style="background:#fff;border-radius:15px;padding:15px;">
                                <div id="myfirstchart"></div>
                                <script>
                                    new Morris.Line({
                                        // ID of the element in which to draw the chart.
                                        element: 'myfirstchart',
                                        // Chart data records -- each entry in this array corresponds to a point on
                                        // the chart.
                                        data: [
                                            { year: '2008', value: 20 },
                                            { year: '2009', value: 10 },
                                            { year: '2010', value: 5 },
                                            { year: '2011', value: 5 },
                                            { year: '2012', value: 20 }
                                        ],
                                        // The name of the data record attribute that contains x-values.
                                        xkey: 'year',
                                        // A list of names of data record attributes that contain y-values.
                                        ykeys: ['value'],
                                        // Labels for the ykeys -- will be displayed when you hover over the
                                        // chart.
                                        labels: ['Value']
                                        });
                                </script>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-3">
                            <div id="donut-example"></div>
                        </div>
                        <div class="col-md-3">
                            <div id="donut-example2"></div>
                        </div>
                        <div class="col-md-3">
                            <div id="donut-example3"></div>
                        </div>
                        <div class="col-md-3">
                            <div id="donut-example4"></div>
                        </div>
                        <script>
                            Morris.Donut({
                            element: 'donut-example',
                            data: [
                                {label: "Download Sales", value: 12},
                                {label: "In-Store Sales", value: 30},
                                {label: "Mail-Order Sales", value: 20}
                            ]
                            });
                            Morris.Donut({
                            element: 'donut-example2',
                            data: [
                                {label: "Download Sales", value: 12},
                                {label: "In-Store Sales", value: 30},
                                {label: "Mail-Order Sales", value: 20}
                            ]
                            });
                            Morris.Donut({
                            element: 'donut-example3',
                            data: [
                                {label: "Download Sales", value: 12},
                                {label: "In-Store Sales", value: 30},
                                {label: "Mail-Order Sales", value: 20}
                            ]
                            });
                            Morris.Donut({
                            element: 'donut-example4',
                            data: [
                                {label: "Download Sales", value: 12},
                                {label: "In-Store Sales", value: 30},
                                {label: "Mail-Order Sales", value: 20}
                            ]
                            });
                        </script>
                    </div>
                    <div class="row">
                        <div class="col-md-6">
                            dona
                        </div>
                        <div class="col-md-6">
                            dona
                        </div>
                    </div>
                </div> 
                <div class="footbar"></div>
            </div>
        </div>
    </div>        
