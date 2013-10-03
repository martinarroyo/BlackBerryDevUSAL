import bb.cascades 1.2

Page {
    
    function aFahrenheit(grados) {
        return 1.8 * grados + 32;
    }
    
    function aGrados(fahrenheit) {
        return (fahrenheit - 32) / 1.8;
    }
    
    Container {
        Label {
            id: titulo
            text: "Conversor Fahrenheit-Centígrados"
            textStyle.fontSize: FontSize.PointValue
            textStyle.fontSizeValue: 10
            verticalAlignment: VerticalAlignment.Top
            horizontalAlignment: HorizontalAlignment.Center
        
        }
        
        ImageView {
            imageSource: "asset:///images/termometro.png"
            scalingMethod: ScalingMethod.AspectFit
            preferredHeight: 400.0
            horizontalAlignment: HorizontalAlignment.Center
        }
        
        TextField {
            id: centigrados
            hintText: "ºC"
            //Limitamos la introducción de caracteres a números y puntos
            inputMode: TextFieldInputMode.NumbersAndPunctuation
            
            //En caso de que el texto haya sido cambiado, llamamos a la función
            onTextChanged: {
                fahrenheit.text = aFahrenheit(text)
            }
            
            verticalAlignment: VerticalAlignment.Center
            horizontalAlignment: HorizontalAlignment.Center
            //Definimos la proporción de tamaño que ocupará este elemento
            preferredWidth: 300
            
        }
        
        TextField {
            id: fahrenheit
            hintText: "Fahrenheit"
            inputMode: TextFieldInputMode.NumbersAndPunctuation
            onTextChanged: {
                centigrados.text = aGrados(text)
            }
            horizontalAlignment: HorizontalAlignment.Center
            verticalAlignment: VerticalAlignment.Center
            preferredWidth: 300
            
        }
        
        
    }
}