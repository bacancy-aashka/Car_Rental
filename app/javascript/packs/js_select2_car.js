document.addEventListener("turbolinks:load", function(){
    $("#car_name").select2({
        theme: "bootstrap",
        autoClear: false,
        tags: true,
        width: '196px',
        height:'38px'
    });
    $("#car_seats").select2({
        theme: "bootstrap",
        tags: true,
        width: '150px'
    });
    $("#car_luggage").select2({
        theme: "bootstrap",
        tags: true,
        width: '150px'
    });
    $("#car_min_kms").select2({
        theme: "bootstrap",
        tags: true,
        width: '150px'
    });
    $("#car_cost_per_km").select2({
        theme: "bootstrap",
        tags: true,
        width: '150px'
    });
    $("#car_car_type_id").select2({
        theme: "bootstrap",
        width: '200px',
    });
    $("#car_car_fuel_id").select2({
      theme: "bootstrap",
      width: '200px',
  });
})