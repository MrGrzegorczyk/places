<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/include/header.jsp" %>
<%@ include file="/WEB-INF/include/navbar.jsp" %>

<c:url value="/place/edit" var="editPlaceUrl"/>
<c:url value="/place/delete" var="deletePlaceUrl"/>

<div class="container">

    <h1>List of my places</h1>

    <div class="row">
        <div class="col-md-12">
            <table class="table table-striped table-hover table-bordered">
                <thead>
                <tr>
                    <th class="text-center col-md-1">Id</th>
                    <th class="text-center col-md-3">Name</th>
                    <th class="text-center col-md-4">Description</th>
                    <th class="text-center col-md-2">GPS (lon, lat)</th>
                    <th class="text-center col-md-1">Edit</th>
                    <th class="text-center col-md-1">Delete</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="place" items="${myPlacesList}">
                    <tr>
                        <td>${place.id}</td>
                        <td>${place.name}</td>
                        <td>${place.description}</td>
                        <td class="text-center">
                            <a href="#my-places-map">${place.longitude}, ${place.latitude}</a>
                        </td>
                        <td class="text-center">
                            <a href="${editPlaceUrl}/${place.id}" class="btn btn-sm btn-primary">Edit</a>
                        </td>
                        <td class="text-center">
                            <a href="${deletePlaceUrl}/${place.id}" class="btn btn-sm btn-danger delete-button">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    
    <section id="my-places-map">
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
      mappingLayer = new OpenLayers.Layer.OSM("My places");
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
  
      <c:forEach items="${myPlacesList}" var="place">
          addPlaceMarker(${place.longitude}, ${place.latitude}, "${place.name}", "${place.description}");
      </c:forEach>
  });
</script>

<%@ include file="/WEB-INF/include/footer.jsp" %>