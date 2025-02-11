obj = Object()
print(luajava.callMethod(obj, 'hashCode'))

Math = luajava.bindClass('java.lang.Math')
print(luajava.callStaticMethod(Math, 'random'))
