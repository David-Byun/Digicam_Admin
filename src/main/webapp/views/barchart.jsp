<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
    #myArea {
        height: 350px;
    }

    .highcharts-figure,
    .highcharts-data-table table {
        min-width: 310px;
        max-width: 800px;
        margin: 1em auto;
    }

    .highcharts-data-table table {
        font-family: Verdana, sans-serif;
        border-collapse: collapse;
        border: 1px solid #ebebeb;
        margin: 10px auto;
        text-align: center;
        width: 100%;
        max-width: 500px;
    }

    .highcharts-data-table caption {
        padding: 1em 0;
        font-size: 1.2em;
        color: #555;
    }

    .highcharts-data-table th {
        font-weight: 600;
        padding: 0.5em;
    }

    .highcharts-data-table td,
    .highcharts-data-table th,
    .highcharts-data-table caption {
        padding: 0.5em;
    }

    .highcharts-data-table thead tr,
    .highcharts-data-table tr:nth-child(even) {
        background: #f8f8f8;
    }

    .highcharts-data-table tr:hover {
        background: #f1f7ff;
    }

</style>
<script>
    let myAreaChart = {
        init : function () {
            Highcharts.chart('myArea', {
                chart: {
                    type: 'column',
                    options3d: {
                        enabled: true,
                        alpha: 15,
                        beta: 15,
                        viewDistance: 25,
                        depth: 40
                    }
                },

                title: {
                    text: '월별 성별 매출',
                    align: 'left'
                },

                xAxis: {
                    labels: {
                        skew3d: true,
                        style: {
                            fontSize: '16px'
                        }
                    }
                },

                yAxis: {
                    allowDecimals: false,
                    min: 0,
                    title: {
                        text: 'TWh',
                        skew3d: true,
                        style: {
                            fontSize: '16px'
                        }
                    }
                },
                tooltip: {
                    headerFormat: '<b>{point.key}</b><br>',
                    pointFormat: '<span style="color:{series.color}">\u25CF</span> {series.name}: {point.y} / {point.stackTotal}'
                },

                plotOptions: {
                    series: {
                        pointStart: 2016
                    },
                    column: {
                        stacking: 'normal',
                        depth: 40
                    }
                },

                series: [{
                    name: 'South Korea',
                    data: [563, 567, 590, 582, 571],
                    stack: 'Asia'
                }, {
                    name: 'Germany',
                    data: [650, 654, 643, 612, 572],
                    stack: 'Europe'
                }, {
                    name: 'Saudi Arabia',
                    data: [368, 378, 378, 367, 363],
                    stack: 'Asia'
                }, {
                    name: 'France',
                    data: [564, 562, 582, 571, 533],
                    stack: 'Europe'
                }]
            });

        }
    }
    $(function () {
        myAreaChart.init();
    })
</script>
<div id="myArea"></div>
