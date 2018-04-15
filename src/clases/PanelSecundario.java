/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package clases;
import java.awt.Cursor;
import java.util.ArrayList;
import javax.swing.ImageIcon;
import javax.swing.JOptionPane;
import javax.swing.JTextArea;
/*jess*/
import jess.ConsolePanel;
import jess.JessException;
import jess.Rete;
/**
 *
 * @author Ariel
 */
public class PanelSecundario extends javax.swing.JPanel {

    /**
     * Creates new form Inicio
     */
    private JTextArea areaPregunta;
    private Main padre;
    Rete motor;
    ConsolePanel consolaPanel;
    ArrayList <Object> datosConsola= new ArrayList();
    int contador=0;
    JOptionPane panelOpciones= new JOptionPane();
    contenedorExplicaciones expli=new contenedorExplicaciones();
    public PanelSecundario(Main padre) {
        this.padre=padre;
        datosConsola=getconsole();
        areaPregunta=new JTextArea();
        areaPregunta.setFont(new java.awt.Font("Tahoma", 1, 12));
        //areaPregunta.setForeground(new java.awt.Color(0,0,0));
        areaPregunta.setCursor(Cursor.getDefaultCursor());
        areaPregunta.setFocusable(false);
        areaPregunta.setBorder(javax.swing.BorderFactory.createEmptyBorder(4, 4, 4, 4));
        initComponents();
        
        
    }
    /*Metodo usado para preguntar, es llamado desde el lenguaje CLIP
    **recibe la pregunta y sus opciones de respuesta como parametros*/
    public String preguntar2(String pregunta, ArrayList opciones){
        int tam = opciones.size();//pido el tam de las opciones
        areaPregunta.setText(pregunta);//actualizo la nueva pregunta
        Object datos[] = new Object[tam];//creo donde almacenare temporalmente las opciones
        int i = 0;//declaro un contador
        for (Object opcion : opciones) {//recorro y voy agregando las opciones de respuesta
            datos[i] = (Object)opcion;
            i++;
        }
        /*Preguntainador dialogoModal = new Preguntainador(padre,pregunta,datos);
        //dialogoModal.pack();  // para darle tamaño automático a la ventana
        dialogoModal.setSize(500, 390);
        dialogoModal.setLocationRelativeTo(panelPreguntas);
        dialogoModal.setVisible(true);     
        return dialogoModal.getText();//devuelvo la respuesta escogida*/
        return "null";
    }
    public String preguntar(String pregunta, int imagen, int explicacion, ArrayList opciones){
        int tam = opciones.size();//pido el tam de las opciones
        areaPregunta.setText(pregunta);//actualizo la nueva pregunta
        Object datos[] = new Object[tam];//creo donde almacenare temporalmente las opciones
        int i = 0;//declaro un contador
        for (Object opcion : opciones) {//recorro y voy agregando las opciones de respuesta
            datos[i] = (Object)opcion;
            i++;
        }
        Preguntainador dialogoModal = new Preguntainador(padre,pregunta,imagen, expli.getExplicacionBy(explicacion), datos);
        //dialogoModal.pack();  // para darle tamaño automático a la ventana.
        dialogoModal.setSize(500, 390);//aqui doy tamaño definido a la ventana
        dialogoModal.setLocationRelativeTo(panelPreguntas);
        dialogoModal.setVisible(true);     
        return dialogoModal.getText();//devuelvo la respuesta escogida
    }
    
    /*Metodo que hace la CONEXION de Jess con Java*/
    public ArrayList <Object> getconsole()
    {
        ArrayList <Object> lista=new ArrayList <Object>();
        Rete motorJess;//inicializo el motor de inferencia
        ConsolePanel consolas = null;
        motorJess=new Rete();//creo el motor de inferencia
        try {
            motorJess.batch("/base_conocimiento/conocimiento_turismo_cbba.clp");//cargo Base de Conocimiento
            motorJess.store("VENTANA", this);
            consolas = new ConsolePanel(motorJess);//creo la consola del motor de inferencia
            
            motorJess.eval("(rules)");//evaluo las reglas
        } catch (JessException e) {
            System.out.println("ERROR " + e.getMessage());
        }
        lista.add(motorJess);//agrego a la lista el motor de inferencia
        lista.add(consolas);//agrego su consola del motor de inferencia
        return lista;//devuelvo la lista
    }
    
    public void setMemoriaTrabajo(String texto)
    {
        memoria_trabajo.append("\n" + texto);
    }
    public void iniciarMotorDeInferencia(){
        contador++;
        if(contador >=0) {
            try {
                motor= (Rete) datosConsola.get(0);
                motor.reset();
                motor.run();
                motor.eval("(facts)");
                motor.clear();
            } catch(JessException j){
                System.out.println(" " + j.getMessage());
            }
        } 
    }
    public void reiniciarMotorDeInferencia(){
        try {
                datosConsola=getconsole();
                motor= (Rete) datosConsola.get(0);
                motor.reset();
                motor.run();
                motor.eval("(facts)");
                motor.clear();
        } catch(JessException j){
            System.out.println(" " + j.getMessage());
        }        
    }
    
    public void setImagenResp(String nombre){
        ImageIcon setImg = createImageIcon("/respuestas_obtenidas/"+nombre,"fondo");
        lblFondo.setIcon(setImg);
        lblFondo.setVisible(true);
    }
    
    private ImageIcon createImageIcon(String path, String description){
        java.net.URL imgURL = getClass().getResource(path);
        if (imgURL != null) {
            return new ImageIcon(imgURL, description);
        } else {
            System.err.println("Couldn't find file: " + path);
            return null;
        }
    }
    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        panelPreguntas = new javax.swing.JPanel();
        btnReiniciar = new javax.swing.JButton();
        lblFondo = new javax.swing.JLabel();
        panelMemoriaTrabajo = new javax.swing.JPanel();
        scrrolPanelPreg = new javax.swing.JScrollPane();
        memoria_trabajo = new javax.swing.JTextArea();
        panelMotorInferencia = new javax.swing.JPanel();
        fondo = new javax.swing.JLabel();
        jPanel1 = new javax.swing.JPanel();
        panelPreguntas1 = new javax.swing.JPanel();
        btnReiniciar1 = new javax.swing.JButton();
        lblFondo1 = new javax.swing.JLabel();
        panelMemoriaTrabajo1 = new javax.swing.JPanel();
        scrrolPanelPreg1 = new javax.swing.JScrollPane();
        memoria_trabajo1 = new javax.swing.JTextArea();
        panelMotorInferencia1 = new javax.swing.JPanel();
        fondo1 = new javax.swing.JLabel();

        setLayout(null);

        panelPreguntas.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Area de Preguntas", javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 12))); // NOI18N
        panelPreguntas.setLayout(null);

        btnReiniciar.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        btnReiniciar.setIcon(new javax.swing.ImageIcon(getClass().getResource("/images/init1.png"))); // NOI18N
        btnReiniciar.setToolTipText("reiniciar");
        btnReiniciar.setBorder(null);
        btnReiniciar.setBorderPainted(false);
        btnReiniciar.setContentAreaFilled(false);
        btnReiniciar.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnReiniciar.setFocusPainted(false);
        btnReiniciar.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/images/init2.png"))); // NOI18N
        btnReiniciar.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnReiniciarActionPerformed(evt);
            }
        });
        panelPreguntas.add(btnReiniciar);
        btnReiniciar.setBounds(180, 290, 140, 100);

        lblFondo.setVisible(false);
        lblFondo.setOpaque(true);
        panelPreguntas.add(lblFondo);
        lblFondo.setBounds(10, 20, 500, 390);

        add(panelPreguntas);
        panelPreguntas.setBounds(10, 10, 520, 430);

        panelMemoriaTrabajo.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Memoria de Trabajo", javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 12))); // NOI18N
        panelMemoriaTrabajo.setLayout(new javax.swing.BoxLayout(panelMemoriaTrabajo, javax.swing.BoxLayout.LINE_AXIS));

        scrrolPanelPreg.setBorder(null);

        memoria_trabajo.setColumns(20);
        memoria_trabajo.setRows(5);
        memoria_trabajo.setBorder(null);
        scrrolPanelPreg.setViewportView(memoria_trabajo);

        panelMemoriaTrabajo.add(scrrolPanelPreg);

        add(panelMemoriaTrabajo);
        panelMemoriaTrabajo.setBounds(540, 10, 440, 620);

        panelMotorInferencia.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Motor de Inferencia", javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 12))); // NOI18N
        panelMotorInferencia.setLayout(null);
        /// Cuadro de Base del Conocimiento
        consolaPanel=(ConsolePanel) datosConsola.get(1);
        consolaPanel.setBounds(10, 20, 490, 165);
        //consolaPanel.setFont(new Font("Forte", Font.BOLD, 14));
        panelMotorInferencia.add(consolaPanel);
        add(panelMotorInferencia);
        panelMotorInferencia.setBounds(20, 440, 510, 190);
        add(fondo);
        fondo.setBounds(0, 0, 1020, 650);

        jPanel1.setLayout(null);

        panelPreguntas1.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Area de Preguntas", javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 12))); // NOI18N
        panelPreguntas1.setLayout(null);

        btnReiniciar1.setFont(new java.awt.Font("Tahoma", 1, 12)); // NOI18N
        btnReiniciar1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/images/init1.png"))); // NOI18N
        btnReiniciar1.setToolTipText("reiniciar");
        btnReiniciar1.setBorder(null);
        btnReiniciar1.setBorderPainted(false);
        btnReiniciar1.setContentAreaFilled(false);
        btnReiniciar1.setCursor(new java.awt.Cursor(java.awt.Cursor.HAND_CURSOR));
        btnReiniciar1.setFocusPainted(false);
        btnReiniciar1.setRolloverIcon(new javax.swing.ImageIcon(getClass().getResource("/images/init2.png"))); // NOI18N
        btnReiniciar1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                btnReiniciar1ActionPerformed(evt);
            }
        });
        panelPreguntas1.add(btnReiniciar1);
        btnReiniciar1.setBounds(180, 290, 140, 100);

        lblFondo.setVisible(false);
        lblFondo1.setOpaque(true);
        panelPreguntas1.add(lblFondo1);
        lblFondo1.setBounds(10, 20, 500, 390);

        jPanel1.add(panelPreguntas1);
        panelPreguntas1.setBounds(10, 10, 520, 430);

        panelMemoriaTrabajo1.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Memoria de Trabajo", javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 12))); // NOI18N
        panelMemoriaTrabajo1.setLayout(new javax.swing.BoxLayout(panelMemoriaTrabajo1, javax.swing.BoxLayout.LINE_AXIS));

        scrrolPanelPreg1.setBorder(null);

        memoria_trabajo1.setColumns(20);
        memoria_trabajo1.setRows(5);
        memoria_trabajo1.setBorder(null);
        scrrolPanelPreg1.setViewportView(memoria_trabajo1);

        panelMemoriaTrabajo1.add(scrrolPanelPreg1);

        jPanel1.add(panelMemoriaTrabajo1);
        panelMemoriaTrabajo1.setBounds(540, 10, 440, 620);

        panelMotorInferencia1.setBorder(javax.swing.BorderFactory.createTitledBorder(null, "Motor de Inferencia", javax.swing.border.TitledBorder.CENTER, javax.swing.border.TitledBorder.DEFAULT_POSITION, new java.awt.Font("Tahoma", 1, 12))); // NOI18N
        panelMotorInferencia1.setLayout(null);
        /// Cuadro de Base del Conocimiento
        consolaPanel=(ConsolePanel) datosConsola.get(1);
        consolaPanel.setBounds(10, 20, 490, 165);
        //consolaPanel.setFont(new Font("Forte", Font.BOLD, 14));
        //panelMotorInferencia.add(consolaPanel);
        jPanel1.add(panelMotorInferencia1);
        panelMotorInferencia1.setBounds(20, 440, 510, 190);
        jPanel1.add(fondo1);
        fondo1.setBounds(0, 0, 1020, 650);

        add(jPanel1);
        jPanel1.setBounds(0, 0, 0, 0);
    }// </editor-fold>//GEN-END:initComponents

    private void btnReiniciarActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnReiniciarActionPerformed
        // TODO add your handling code here:
        lblFondo.setVisible(false);
        reiniciarMotorDeInferencia();
    }//GEN-LAST:event_btnReiniciarActionPerformed

    private void btnReiniciar1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_btnReiniciar1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_btnReiniciar1ActionPerformed


    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton btnReiniciar;
    private javax.swing.JButton btnReiniciar1;
    private javax.swing.JLabel fondo;
    private javax.swing.JLabel fondo1;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JLabel lblFondo;
    private javax.swing.JLabel lblFondo1;
    private javax.swing.JTextArea memoria_trabajo;
    private javax.swing.JTextArea memoria_trabajo1;
    private javax.swing.JPanel panelMemoriaTrabajo;
    private javax.swing.JPanel panelMemoriaTrabajo1;
    private javax.swing.JPanel panelMotorInferencia;
    private javax.swing.JPanel panelMotorInferencia1;
    private javax.swing.JPanel panelPreguntas;
    private javax.swing.JPanel panelPreguntas1;
    private javax.swing.JScrollPane scrrolPanelPreg;
    private javax.swing.JScrollPane scrrolPanelPreg1;
    // End of variables declaration//GEN-END:variables
}
