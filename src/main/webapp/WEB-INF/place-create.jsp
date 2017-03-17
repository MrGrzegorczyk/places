<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/include/header.jsp" %>
<%@ include file="/WEB-INF/include/navbar.jsp" %>

<c:url var="createPlaceUrl" value="/place/save"/>

<div class="container">

    <h1>Add new place</h1>

    <div class="row">
        <form:form commandName="place" action="${createPlaceUrl}" method="post" role="form" class="form-horizontal">
            <form:hidden path="id" />
            <form:hidden path="userId" />
            <div class="form-group">
                <label class="control-label col-sm-2" for="name">Name:</label>
                <div class="col-sm-6">
                    <form:input path="name" type="text" id="name" class="form-control" placeholder="Enter name" />
                    <form:errors path="name" cssStyle="color: red" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="description">Short description:</label>
                <div class="col-sm-6">
                    <form:input path="description" type="text" id="description" class="form-control" placeholder="Describe your place" />
                    <form:errors path="description" cssStyle="color: red" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="longitude">GPS Longitude:</label>
                <div class="col-sm-6">
                    <form:input path="longitude" type="text" id="longitude" class="form-control" placeholder="Longitude, i.e.: 20.9207704" />
                    <form:errors path="longitude" cssStyle="color: red" />
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2" for="latitude">GPS Latitude:</label>
                <div class="col-sm-6">
                    <form:input path="latitude" type="text" id="latitude" class="form-control" placeholder="Latitude, i.e.: 52.2328546" />
                    <form:errors path="latitude" cssStyle="color: red" />
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-2">
                    <button type="submit" class="btn btn-primary">Add</button>
                    <a href="/" class="btn btn-danger">Cancel</a>
                </div>
                <div class="col-sm-offset-2 col-sm-2">
                    <button type="button" onclick="showPlaceMarker()" class="btn btn-default">Show on map</button>
                </div>
            </div>
        </form:form>
    </div>
    <section id="map-preview">
        <div class="row">
            <div class="col-lg-12" id="place-map" style="height:600px">
            </div>
        </div>
    </section>

</div>

<%@ include file="/WEB-INF/include/scripts.jsp" %>

    <script>
        var map, mappingLayer, vectorLayer, selectMarkerControl, selectedFeature;

        function onFeatureSelect(feature) {
            selectedFeature = feature;
            popup = new OpenLayers.Popup.FramedCloud("tempId", 
                        feature.geometry.getBounds().getCenterLonLat(), null,
                        "<b>"+feature.attributes.Name + "</b><br>" + feature.attributes.Desc,
                        null, true);
            feature.popup = popup;
            map.addPopup(popup);
        }

        function onFeatureUnselect(feature) {
            map.removePopup(feature.popup);
            feature.popup.destroy();
            feature.popup = null;
        }

        function addPlaceMarker(lon, lat, name, description) {
            var lonLatPoint = new OpenLayers.Geometry.Point(lon, lat);
            lonLatPoint.transform("EPSG:4326", map.getProjectionObject());
            var pointFeature = new OpenLayers.Feature.Vector(lonLatPoint, {Name: name, Desc: description});
            vectorLayer.addFeatures(pointFeature);
        }

        function showPlaceMarker() {
            vectorLayer.destroyFeatures();
            lon = $('#longitude').val();
            lat =  $('#latitude').val();
            name = $('#name').val();
            description = $('#description').val();
            addPlaceMarker(lon, lat, name, description);
            map.setCenter(
                new OpenLayers.LonLat(lon,lat).transform(
                    new OpenLayers.Projection("EPSG:4326"),
                    map.getProjectionObject())
                , 6
            );
        }

        $(function() {
            map = new OpenLayers.Map("place-map");
            mappingLayer = new OpenLayers.Layer.OSM("New place");
            map.addLayer(mappingLayer);
            vectorLayer = new OpenLayers.Layer.Vector("Vector Layer", {projection: "EPSG:4326"}); 
            selectMarkerControl = new OpenLayers.Control.SelectFeature(vectorLayer, {onSelect: onFeatureSelect, onUnselect: onFeatureUnselect});
            map.addControl(selectMarkerControl);

            selectMarkerControl.activate();
            map.addLayer(vectorLayer);
            map.setCenter(
                new OpenLayers.LonLat(20.9207704,52.2328546).transform(
                    new OpenLayers.Projection("EPSG:4326"),
                    map.getProjectionObject())

                , 3
            );

        });
    </script>

<%@ include file="/WEB-INF/include/footer.jsp" %>