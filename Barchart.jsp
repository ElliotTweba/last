<%@page import="org.jfree.chart.ChartPanel"%>
<%@page import="java.awt.Color"%>
<%@page import="org.jfree.chart.plot.CategoryPlot"%>
<%@page import="org.jfree.chart.plot.PlotOrientation"%>
<%@page import="org.jfree.chart.JFreeChart"%>
<%@page import="org.jfree.chart.ChartFactory"%>
<%@page import="org.jfree.data.category.DefaultCategoryDataset"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Health Bank</title>
    </head>
    <body>
        <h1>Bar Chart</h1>
        <button type="submit" name="btn">View</button>
        <%
            DefaultCategoryDataset barChart = new DefaultCategoryDataset();
            barChart.setValue(200,"Contribute Amt", "Jan");
            barChart.setValue(300,"Contribute Amt", "Feb");
            barChart.setValue(400,"Contribute Amt", "March");
            
           JFreeChart barChartData = ChartFactory.createBarChart("SELL", "jan", "feb", barChart, PlotOrientation.VERTICAL, false, true, false);
           CategoryPlot barchrt = barChartData.getCategoryPlot();
           barchrt.setRangeGridlinePaint(Color.ORANGE);
           
           ChartPanel barPanel = new ChartPanel(barChartData);
           
        
        %>
    </body>
</html>
