/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package clases;

/**
 *
 * @author Galvez
 */
public class contenedorExplicaciones {
    private String[] explicaciones;
    public contenedorExplicaciones(){
        explicaciones= new String[5];//ese 5 es el tamaño
        cargarExplicaciones();
    }
    /** 
     * debes agregar aqui tus explicaciones, si requieres mas agrega y modifica el n
     * si quires hacer salto de linea agregas <br>
     */
    private void cargarExplicaciones(){//va desde el 0 hasta el n-1, en este caso n es 10
        explicaciones[0]="<html><h3>"//no tocar
                        + "Explicacion 1<br>"//aqui si
                        + "Aqui agregaria alguna explicacion si<br>"//aqui si
                        + "se me ocurriera una"//aqui si
                        + "</h3></html>";//no tocar
        explicaciones[1]="<html><h3>"
                        + "Explicacion 2<br>"
                        + "Aqui agregaria alguna explicacion si<br>"
                        + "se me ocurriera una"
                        + "</h3></html>";
        explicaciones[2]="<html><h3>"
                        + "Explicacion 3<br>"
                        + "Aqui agregaria alguna explicacion si<br>"
                        + "se me ocurriera una"
                        + "</h3></html>";
        explicaciones[3]="<html><h3>"
                        + "Explicacion 4<br>"
                        + "Aqui agregaria alguna explicacion si<br>"
                        + "se me ocurriera una"
                        + "</h3></html>";
        explicaciones[4]="<html><h3>"
                        + "Explicacion 5<br>"
                        + "Aqui agregaria alguna explicacion si<br>"
                        + "se me ocurriera una"
                        + "</h3></html>";
    }
    public String getExplicacionBy(int id){
        return explicaciones[id];//asumiendo q siempre se enviara un id valido, no corregi q aceptara errores
    }
}
