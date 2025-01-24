--guardare todas las consultas aqui y explicare para que son

-- querry para poder ver los productos y su estado en precio costo stock categoria talla y el stock de la talla
SELECT 
    p.id_producto,
    p.nombre AS nombre_producto,
    p.descripcion,
    p.precio,
    p.costo,
    p.stock AS stock_total,
    p.estado,
    c.nombre_categoria,
    t.talla,
    pt.stock_talla
FROM 
    productos p
JOIN 
    productos_categorias pc ON p.id_producto = pc.id_producto
JOIN 
    categorias c ON pc.id_categoria = c.id_categoria
JOIN 
    productos_tallas pt ON p.id_producto = pt.id_producto
JOIN 
    tallas t ON pt.id_talla = t.id_talla
ORDER BY 
    p.id_producto, t.id_talla;