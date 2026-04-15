/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package ab;

import java.util.Scanner;

/**
 *
 * @author Aluno CA
 */
public class Ab {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        Scanner scanner = new Scanner(System.in);

        String nome;
        String escola;
        double nota;
        double media = 0;
        
        System.out.println("Qual é seu nome");
        nome = scanner.nextLine();
           
        System.out.println("Qual é o nome da sua escola?");
        escola = scanner.nextLine();
        
                
                      System.out.println("Fale uma de suas notas");
        nota = scanner.nextDouble();
        media = media + nota;
        
        if(nota <= 10){
             System.out.println("Fale uma de suas notas");
        nota = scanner.nextDouble();
        media = media + nota; 
        }
        else{
        System.out.println("Nota invalida");
        System.exit(0);
    }
               
         if(nota <= 10){
             System.out.println("Fale uma de suas notas");
        nota = scanner.nextDouble();
        media = media + nota; 
        }
        else{
        System.out.println("Nota invalida");
        System.exit(0);
    }
               
                
   if(nota <= 10){
             System.out.println("Fale uma de suas notas");
        nota = scanner.nextDouble();
        media = media + nota; 
        }
        else{
        System.out.println("Nota invalida");
        System.exit(0);
    }
   if(nota <= 10){
             System.out.println("Fale uma de suas notas");
        nota = scanner.nextDouble();
        media = media + nota; 
        }
        else{
        System.out.println("Nota invalida");
        System.exit(0);
    }
               
   if(nota <= 10){
             System.out.println("Fale uma de suas notas");
        nota = scanner.nextDouble();
        media = media + nota; 
        }
        else{
        System.out.println("Nota invalida");
        System.exit(0);
    }
   media = media / 6;
      
           System.out.println(nome + " sua média na escola " + escola + " é: " +media);
        
        
        
    }
    
}
