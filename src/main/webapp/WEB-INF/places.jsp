<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="/WEB-INF/include/header.jsp" %>
<%@ include file="/WEB-INF/include/navbar.jsp" %>

<div class="container">

    <h1>List of all places (${fn:length(placesList)})</h1>
    
    <section id="all-places-map">
        <div class="row">
            <div class="col-lg-12" id="places-map" style="height:600px">
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
  
  function addPlaceMarker(lon, lat, name, description){
      var lonLatPoint = new OpenLayers.Geometry.Point(lon, lat);
      lonLatPoint.transform("EPSG:4326", map.getProjectionObject());
      var pointFeature = new OpenLayers.Feature.Vector(lonLatPoint, {Name: name, Desc: description});
      vectorLayer.addFeatures(pointFeature);
  }
  
  $(function() {
      map = new OpenLayers.Map("places-map");
      mappingLayer = new OpenLayers.Layer.OSM("All places");
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
  
      <c:forEach items="${placesList}" var="place">
          addPlaceMarker(${place.longitude}, ${place.latitude}, "${place.name}", "${place.description}");
      </c:forEach>
  });
</script>

<%@ include file="/WEB-INF/include/footer.jsp" %>