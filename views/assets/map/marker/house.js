
function addHousesLayer(map) {
    
    map.addInteractiveLayer('houses', houses, {
        name: "Wolne domy",
        create_checkbox: true,
        create_feature_popup: true,
        is_default: true,
        sidebar_icon_html: '<i  style="color: green" class="fas fa-house"></i>',
        pointToLayer: function (feature, latlng) {
            return L.marker(latlng, {
                icon: Utils.getCustomIcon('fa-house'),
                riseOnHover: true
            });
        },
        coordsToLatLng: function (coords) {
            return gtaCoordinatesToLeaflet(coords);
        }
    });
  }
  
  
  
  
  
  function addOccupiedHouses(map) {
    map.addInteractiveLayer('occupiedhouses', occupiedhouses, {
        name: "Zajęte domy",
        create_checkbox: true,
        create_feature_popup: true,
        is_default: true,
        sidebar_icon_html: '<i  style="color: red" class="fas fa-house x"></i>',
        pointToLayer: function (feature, latlng) {
            return L.marker(latlng, {
                icon: Utils.getCustomIcon('fa-house x'),
                riseOnHover: true
            });
        },
        coordsToLatLng: function (coords) {
            return gtaCoordinatesToLeaflet(coords);
        }
    });
  }
  
  
  
  
  
  var houses = {
    "type": "FeatureCollection",
    "features": []
  };
  var occupiedhouses = {
    "type": "FeatureCollection",
    "features": []
  };
  
  
  fetch('/houses').then(response => response.json()).then(data => {
    data.forEach(house => {
        if(house.owner > 0) {
            occupiedhouses.features.push({
                "type": "Feature",
                "properties": {
                    "id": `${house.price}$ (ZAJĘTY DOM)`,
                },
                "geometry": {
                    "type": "Point",
                    "coordinates": [
                        house.posx,
                        house.posy,
                        house.posz
                    ]
                } 
            })
        } else {
                houses.features.push({
                    "type": "Feature",
                    "properties": {
                        "id": `${house.price}$ (WOLNY DOM)`,
                    },
                    "geometry": {
                        "type": "Point",
                        "coordinates": [
                            house.posx,
                            house.posy,
                            house.posz
                        ]
                    } 
                })
            }
            })
            startMap()
        })
  
  
    function startMap() {
  
        var interactive_map = new InteractiveMap('map', {
            max_good_zoom: 6,
            max_map_zoom: 8
        });
        
        interactive_map.addTileLayer("Ingame map", {
            minNativeZoom: 2,
            maxNativeZoom: 5
        });
        
        function addPolygonWithPopup(map, coordinates, popupContent, color) {
            var latlngs = coordinates.map(coord => gtaCoordinatesToLeaflet(coord));
            
            var polygon = L.polygon(latlngs, { 
              color: color,
              fillOpacity: 0.3
          }).addTo(map);
          
        
            polygon.bindPopup(popupContent);
        }
        
        addPolygonWithPopup(interactive_map.getMap(), [
            [1991.11, -1022.83],
            [2030.74, -986.25],
            [2073.42, -967.96],
            [2152.67, -971.01],
            [2216.69, -983.2],
            [2265.46, -1013.69],
            [2271.56, -1050.27],
            [2320.33, -1031.98],
            [2341.67, -977.11],
            [2387.39, -937.48],
            [2481.89, -919.19],
            [2555.05, -913.09],
            [2606.87, -931.38],
            [2619.06, -983.2],
            [2628.21, -1041.12],
            [2728.8, -1038.07],
            [2823.3, -1041.12],
            [2823.3, -1123.43],
            [2835.49, -1251.45],
            [2747.09, -1248.41],
            [2731.85, -1156.96],
            [2634.31, -1150.86],
            [2323.38, -1153.91],
            [2225.83, -1138.67],
            [2152.67, -1099.04],
            [2082.56, -1044.17]
        ], "<p>Ceny domów: $6,250 do $12,500</p>", 'orange');
        

        addPolygonWithPopup(interactive_map.getMap(), [
            [2832.1, -1260.82],
            [2862.21, -1388.78],
            [2862.21, -1494.15],
            [2820.81, -1576.95],
            [2805.76, -1644.69],
            [2847.16, -1659.74],
            [2813.29, -1757.59],
            [2813.29, -1874.25],
            [2804.11, -2047.7],
            [2417.99, -2051.09],
            [2407.82, -1969.8],
            [2211.38, -1973.19],
            [2214.76, -1658.2],
            [2279.12, -1488.85],
            [2292.67, -1387.24],
            [2282.5, -1153.53],
            [2716.04, -1150.14],
            [2722.82, -1265.3]
        ], "<p>Ceny domów: $10,000 do $18,000</p>", 'yellow');
        

          
        addPolygonWithPopup(interactive_map.getMap(), [
            [2257.39, -1162.13],
            [2257.39, -1384.35],
            [2251.9, -1502.32],
            [2197.03, -1647.73],
            [2180.57, -1793.13],
            [2186.06, -1883.67],
            [2087.29, -1889.15],
            [2070.83, -1924.82],
            [1818.43, -1924.82],
            [1818.43, -1579.14],
            [1848.61, -1483.12],
            [1845.86, -1192.31],
            [1870.56, -1170.36],
            [1865.07, -1071.6],
            [1911.71, -1038.67],
            [2054.37, -1030.44],
            [2142.16, -1096.29],
            [2197.03, -1134.7]
        ], "<p>Ceny domów: $12,500 do $17,500</p>", 'purple');

          
        addPolygonWithPopup(interactive_map.getMap(), [
            [1874.74, -1026.43],
            [1904.37, -1038.78],
            [1867.33, -1061],
            [1859.92, -1112.85],
            [1857.45, -1172.11],
            [1835.23, -1204.21],
            [1830.29, -1456.06],
            [1817.95, -1530.14],
            [1793.26, -1594.33],
            [1803.13, -1690.63],
            [1795.73, -1826.43],
            [1741.41, -1811.62],
            [1689.55, -1804.21],
            [1667.33, -1861],
            [1366.1, -1868.41],
            [1329.06, -1846.19],
            [1311.78, -1811.62],
            [1311.78, -1544.95],
            [1353.75, -1485.69],
            [1375.97, -1421.49],
            [1363.63, -1120.26],
            [1378.44, -1061],
            [1383.38, -962.23],
            [1452.52, -984.46],
            [1496.96, -1009.15],
            [1543.87, -1011.62],
            [1598.2, -996.8],
            [1652.52, -972.11],
            [1696.96, -999.27],
            [1773.5, -1014.09]
        ], "<p>BRAK DOMÓW</p>", 'pink');

        addPolygonWithPopup(interactive_map.getMap(), [
            [1801.32, -1864.09],
            [1690.21, -1827.06],
            [1665.52, -1881.38],
            [1534.66, -1876.44],
            [1529.72, -2039.4],
            [1593.92, -2133.23],
            [1667.99, -2162.86],
            [2038.36, -2157.92],
            [2134.66, -2222.12],
            [2102.56, -2264.09],
            [2100.09, -2313.48],
            [2171.69, -2355.45],
            [2398.86, -2155.45],
            [2396.39, -2061.63],
            [2393.92, -1980.14],
            [2211.2, -1975.21],
            [2203.79, -1908.54],
            [2095.15, -1901.13],
            [2080.34, -1945.58],
            [1813.67, -1950.51]
        ], "<p>Ceny domów: $17,500 do $20,000</p>", 'orange');

        addPolygonWithPopup(interactive_map.getMap(), [
            [1340.85, -960.7],
            [1319.51, -1387.47],
            [1063.45, -1411.85],
            [624.49, -1402.71],
            [618.4, -1228.95],
            [685.46, -1180.18],
            [743.38, -1082.63],
            [792.15, -1064.34],
            [871.41, -1030.81],
            [950.66, -991.18],
            [1075.65, -969.85],
            [1157.95, -972.89],
            [1255.5, -954.6]
        ], "<p>Ceny domów: $25,000</p>", 'lightblue');

        addPolygonWithPopup(interactive_map.getMap(), [
            [1340.85, -960.7],
            [1319.51, -1387.47],
            [1063.45, -1411.85],
            [624.49, -1402.71],
            [618.4, -1228.95],
            [685.46, -1180.18],
            [743.38, -1082.63],
            [792.15, -1064.34],
            [871.41, -1030.81],
            [950.66, -991.18],
            [1075.65, -969.85],
            [1157.95, -972.89],
            [1255.5, -954.6]
        ], "<p>Ceny domów: $25,000</p>", 'lightblue');

        addPolygonWithPopup(interactive_map.getMap(), [
            [609.05, -1242.31],
            [616.58, -1407.9],
            [1049.36, -1411.66],
            [1038.07, -1498.22],
            [1026.78, -1577.25],
            [1023.02, -1799.29],
            [959.04, -1765.42],
            [797.22, -1765.42],
            [624.1, -1735.31],
            [477.33, -1693.91],
            [383.25, -1701.44],
            [266.58, -1693.91],
            [153.68, -1562.2],
            [311.74, -1407.9],
            [394.54, -1377.79],
            [499.91, -1298.76]
        ], "<p>Ceny domów: $35,000</p>", 'blue');

        addPolygonWithPopup(interactive_map.getMap(), [
            [144.62, -1543.66],
            [95.85, -1522.32],
            [175.1, -1418.68],
            [132.43, -1302.84],
            [153.77, -1226.63],
            [193.39, -1202.25],
            [229.97, -1147.38],
            [281.8, -1141.28],
            [284.84, -1068.12],
            [348.86, -1034.59],
            [449.45, -1022.4],
            [513.47, -985.82],
            [513.47, -912.66],
            [598.82, -918.75],
            [662.83, -891.32],
            [711.61, -827.3],
            [882.31, -790.72],
            [934.14, -693.18],
            [1013.39, -635.26],
            [1110.94, -641.36],
            [1198.21, -640.96],
            [1291.49, -610.78],
            [1340.87, -594.32],
            [1458.84, -624.5],
            [1541.15, -704.06],
            [1549.38, -857.7],
            [1532.92, -915.31],
            [1406.72, -934.51],
            [1250.34, -915.31],
            [986.96, -953.72],
            [877.22, -967.44],
            [830.58, -1022.31],
            [734.56, -1047],
            [660.49, -1148.51],
            [561.72, -1222.58],
            [416.32, -1307.63],
            [309.32, -1384.45],
            [202.33, -1464.01]
        ], "<p>Ceny domów: $325,000 do $750,000</p>", 'red');

        addPolygonWithPopup(interactive_map.getMap(), [
            [1072.29, -1419.86],
            [1316.46, -1419.86],
            [1316.46, -1488.45],
            [1278.05, -1537.83],
            [1286.28, -1847.85],
            [1061.32, -1853.33],
            [1047.6, -1812.18],
            [1039.37, -1749.08],
            [1036.63, -1581.73],
            [1053.09, -1499.42]
        ], "<p>BRAK DOMÓW</p>", 'green');

        addPolygonWithPopup(interactive_map.getMap(), [
            [1073.17, -1418.61],
            [1179.86, -1409.47],
            [1179.86, -1561.88],
            [1039.64, -1558.84]
        ], "<p>Centrum Handlowe Verona</p>", 'black');
        
        addPolygonWithPopup(interactive_map.getMap(), [
            [1695.15, -1607.3],
            [1739.6, -1617.18],
            [1739.6, -1725.82],
            [1697.62, -1723.35]
        ], "<p>Centrum Rockford</p>", 'black');
        
        addPolygonWithPopup(interactive_map.getMap(), [
            [1332.19, -2204.84],
            [1821.08, -2202.37],
            [1816.14, -2372.74],
            [1327.25, -2372.74]
        ], "<p>Lotnisko</p>", 'black');

        addOccupiedHouses(interactive_map)
        addHousesLayer(interactive_map);
        interactive_map.finalize();
  
        
    }


    