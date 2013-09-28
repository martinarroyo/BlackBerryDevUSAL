import bb.cascades 1.0

NavigationPane {

    //Propiedades auxiliares
    property int tamanno: 8

    //Funciones para realizar la conversión
    function aFahrenheit(grados) {
        return 1.8 * grados + 32;
    }

    function aGrados(fahrenheit) {
        return (fahrenheit - 32) / 1.8;
    }

    Page {

        Container {
            //Definimos la disposición de los elementos
            layout: StackLayout {
                orientation: LayoutOrientation.TopToBottom
            }

            Label {
                id: titulo
                text: "Conversor Fahrenheit-Centígrados"
                textStyle.fontSize: FontSize.PointValue
                textStyle.fontSizeValue: tamanno
                
                
                verticalAlignment: VerticalAlignment.Top
                
            }

            Container {
                layout: StackLayout {
                    orientation: LayoutOrientation.LeftToRight
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
                    layoutProperties: StackLayoutProperties {
                        spaceQuota: 1
                    }
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
                    layoutProperties: StackLayoutProperties {
                        spaceQuota: 1
                    }
                }
            }
            
            //Actualiza el valor del título entre los valores 8 y 60
            Slider {
            	fromValue: 8
            	toValue: 60
            	onValueChanged: {
            		tamanno = value                    
             }
            }

        }
    }
}
