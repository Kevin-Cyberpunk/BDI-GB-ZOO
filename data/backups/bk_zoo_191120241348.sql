PGDMP  ;    0            
    |         	   zoologico    17.0    17.0    #           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                           false            $           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                           false            %           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                           false            &           1262    16391 	   zoologico    DATABASE        CREATE DATABASE zoologico WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Colombia.1252';
    DROP DATABASE zoologico;
                     adminzoo    false                        2615    16541    animals    SCHEMA        CREATE SCHEMA animals;
    DROP SCHEMA animals;
                     adminzoo    false                       1255    24740 -   eliminar_animal_por_nombre(character varying)    FUNCTION     �   CREATE FUNCTION public.eliminar_animal_por_nombre(p_nombre character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
    DELETE FROM ANIMALES
    WHERE NOMBRE = p_nombre;
END;
$$;
 M   DROP FUNCTION public.eliminar_animal_por_nombre(p_nombre character varying);
       public               postgres    false                       1255    24741 "   registrar_visita(integer, integer) 	   PROCEDURE     �  CREATE PROCEDURE public.registrar_visita(IN p_id_visitante integer, IN p_id_habitat integer)
    LANGUAGE plpgsql
    AS $$
DECLARE
    v_descuento NUMERIC;
    v_costo_base NUMERIC;
    v_costo_final NUMERIC;
BEGIN

    SELECT DESCUENTO INTO v_descuento
    FROM TIPO_VISITANTES
    WHERE ID = (SELECT IDTipoVisitante FROM VISITANTES WHERE ID = p_id_visitante);

    SELECT CostoBase INTO v_costo_base
    FROM HABITAT
    WHERE ID = p_id_habitat;

    v_costo_final := v_costo_base * (1 - v_descuento / 100);

    INSERT INTO HABITAT_VISITANTES (IDHabitat, IDVisitantes, CostoFinal, FechaVisita)
    VALUES (p_id_habitat, p_id_visitante, v_costo_final, CURRENT_DATE);
END;
$$;
 \   DROP PROCEDURE public.registrar_visita(IN p_id_visitante integer, IN p_id_habitat integer);
       public               postgres    false            �            1259    16546    animales    TABLE     �   CREATE TABLE animals.animales (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    fechanac date,
    idcuidador integer NOT NULL,
    idhabitat integer NOT NULL,
    idespecie integer NOT NULL
);
    DROP TABLE animals.animales;
       animals         heap r       adminzoo    false    6            �            1259    16542    animales_id_seq    SEQUENCE     �   CREATE SEQUENCE animals.animales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE animals.animales_id_seq;
       animals               adminzoo    false    6    254            '           0    0    animales_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE animals.animales_id_seq OWNED BY animals.animales.id;
          animals               adminzoo    false    250            �            1259    16543    animales_idcuidador_seq    SEQUENCE     �   CREATE SEQUENCE animals.animales_idcuidador_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE animals.animales_idcuidador_seq;
       animals               adminzoo    false    254    6            (           0    0    animales_idcuidador_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE animals.animales_idcuidador_seq OWNED BY animals.animales.idcuidador;
          animals               adminzoo    false    251            �            1259    16545    animales_idespecie_seq    SEQUENCE     �   CREATE SEQUENCE animals.animales_idespecie_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE animals.animales_idespecie_seq;
       animals               adminzoo    false    254    6            )           0    0    animales_idespecie_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE animals.animales_idespecie_seq OWNED BY animals.animales.idespecie;
          animals               adminzoo    false    253            �            1259    16544    animales_idhabitat_seq    SEQUENCE     �   CREATE SEQUENCE animals.animales_idhabitat_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE animals.animales_idhabitat_seq;
       animals               adminzoo    false    6    254            *           0    0    animales_idhabitat_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE animals.animales_idhabitat_seq OWNED BY animals.animales.idhabitat;
          animals               adminzoo    false    252                       1259    16615    clima    TABLE     c   CREATE TABLE animals.clima (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);
    DROP TABLE animals.clima;
       animals         heap r       adminzoo    false    6                       1259    16614    clima_id_seq    SEQUENCE     �   CREATE SEQUENCE animals.clima_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE animals.clima_id_seq;
       animals               adminzoo    false    6    275            +           0    0    clima_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE animals.clima_id_seq OWNED BY animals.clima.id;
          animals               adminzoo    false    274                       1259    16557    cuidador    TABLE     �   CREATE TABLE animals.cuidador (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    fechacontratacion date NOT NULL,
    salario numeric(10,2) NOT NULL,
    idespecialidad integer NOT NULL
);
    DROP TABLE animals.cuidador;
       animals         heap r       adminzoo    false    6            �            1259    16555    cuidador_id_seq    SEQUENCE     �   CREATE SEQUENCE animals.cuidador_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE animals.cuidador_id_seq;
       animals               adminzoo    false    6    257            ,           0    0    cuidador_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE animals.cuidador_id_seq OWNED BY animals.cuidador.id;
          animals               adminzoo    false    255                        1259    16556    cuidador_idespecialidad_seq    SEQUENCE     �   CREATE SEQUENCE animals.cuidador_idespecialidad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE animals.cuidador_idespecialidad_seq;
       animals               adminzoo    false    257    6            -           0    0    cuidador_idespecialidad_seq    SEQUENCE OWNED BY     ]   ALTER SEQUENCE animals.cuidador_idespecialidad_seq OWNED BY animals.cuidador.idespecialidad;
          animals               adminzoo    false    256                       1259    16565    especialidad    TABLE     j   CREATE TABLE animals.especialidad (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);
 !   DROP TABLE animals.especialidad;
       animals         heap r       adminzoo    false    6                       1259    16564    especialidad_id_seq    SEQUENCE     �   CREATE SEQUENCE animals.especialidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE animals.especialidad_id_seq;
       animals               adminzoo    false    6    259            .           0    0    especialidad_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE animals.especialidad_id_seq OWNED BY animals.especialidad.id;
          animals               adminzoo    false    258                       1259    16574    especie    TABLE     �   CREATE TABLE animals.especie (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    idfamilia integer NOT NULL,
    idestadoconservacion integer NOT NULL
);
    DROP TABLE animals.especie;
       animals         heap r       adminzoo    false    6                       1259    16571    especie_id_seq    SEQUENCE     �   CREATE SEQUENCE animals.especie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE animals.especie_id_seq;
       animals               adminzoo    false    6    263            /           0    0    especie_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE animals.especie_id_seq OWNED BY animals.especie.id;
          animals               adminzoo    false    260                       1259    16573     especie_idestadoconservacion_seq    SEQUENCE     �   CREATE SEQUENCE animals.especie_idestadoconservacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE animals.especie_idestadoconservacion_seq;
       animals               adminzoo    false    6    263            0           0    0     especie_idestadoconservacion_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE animals.especie_idestadoconservacion_seq OWNED BY animals.especie.idestadoconservacion;
          animals               adminzoo    false    262                       1259    16572    especie_idfamilia_seq    SEQUENCE     �   CREATE SEQUENCE animals.especie_idfamilia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE animals.especie_idfamilia_seq;
       animals               adminzoo    false    6    263            1           0    0    especie_idfamilia_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE animals.especie_idfamilia_seq OWNED BY animals.especie.idfamilia;
          animals               adminzoo    false    261                       1259    16590    estado_conservacion    TABLE     �   CREATE TABLE animals.estado_conservacion (
    id integer NOT NULL,
    codigo character varying(2) NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(50) NOT NULL
);
 (   DROP TABLE animals.estado_conservacion;
       animals         heap r       adminzoo    false    6            
           1259    16589    estado_conservacion_id_seq    SEQUENCE     �   CREATE SEQUENCE animals.estado_conservacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE animals.estado_conservacion_id_seq;
       animals               adminzoo    false    6    267            2           0    0    estado_conservacion_id_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE animals.estado_conservacion_id_seq OWNED BY animals.estado_conservacion.id;
          animals               adminzoo    false    266            	           1259    16583    familia    TABLE     �   CREATE TABLE animals.familia (
    id integer NOT NULL,
    nombrecientifico character varying(50) NOT NULL,
    nombrecomun character varying(50) NOT NULL
);
    DROP TABLE animals.familia;
       animals         heap r       adminzoo    false    6                       1259    16582    familia_id_seq    SEQUENCE     �   CREATE SEQUENCE animals.familia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE animals.familia_id_seq;
       animals               adminzoo    false    6    265            3           0    0    familia_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE animals.familia_id_seq OWNED BY animals.familia.id;
          animals               adminzoo    false    264                       1259    16599    habitat    TABLE     �   CREATE TABLE animals.habitat (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    idubicacion integer NOT NULL,
    costobase numeric(10,2) NOT NULL,
    idclima integer NOT NULL
);
    DROP TABLE animals.habitat;
       animals         heap r       adminzoo    false    6                       1259    16596    habitat_id_seq    SEQUENCE     �   CREATE SEQUENCE animals.habitat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE animals.habitat_id_seq;
       animals               adminzoo    false    6    271            4           0    0    habitat_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE animals.habitat_id_seq OWNED BY animals.habitat.id;
          animals               adminzoo    false    268                       1259    16598    habitat_idclima_seq    SEQUENCE     �   CREATE SEQUENCE animals.habitat_idclima_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 +   DROP SEQUENCE animals.habitat_idclima_seq;
       animals               adminzoo    false    6    271            5           0    0    habitat_idclima_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE animals.habitat_idclima_seq OWNED BY animals.habitat.idclima;
          animals               adminzoo    false    270                       1259    16597    habitat_idubicacion_seq    SEQUENCE     �   CREATE SEQUENCE animals.habitat_idubicacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE animals.habitat_idubicacion_seq;
       animals               adminzoo    false    6    271            6           0    0    habitat_idubicacion_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE animals.habitat_idubicacion_seq OWNED BY animals.habitat.idubicacion;
          animals               adminzoo    false    269                       1259    16641    habitat_visitantes    TABLE     �   CREATE TABLE animals.habitat_visitantes (
    id integer NOT NULL,
    idhabitat integer NOT NULL,
    idvisitantes integer NOT NULL,
    costofinal numeric(10,2) NOT NULL,
    fechavisita date
);
 '   DROP TABLE animals.habitat_visitantes;
       animals         heap r       adminzoo    false    6                       1259    16638    habitat_visitantes_id_seq    SEQUENCE     �   CREATE SEQUENCE animals.habitat_visitantes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE animals.habitat_visitantes_id_seq;
       animals               adminzoo    false    284    6            7           0    0    habitat_visitantes_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE animals.habitat_visitantes_id_seq OWNED BY animals.habitat_visitantes.id;
          animals               adminzoo    false    281                       1259    16639     habitat_visitantes_idhabitat_seq    SEQUENCE     �   CREATE SEQUENCE animals.habitat_visitantes_idhabitat_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE animals.habitat_visitantes_idhabitat_seq;
       animals               adminzoo    false    6    284            8           0    0     habitat_visitantes_idhabitat_seq    SEQUENCE OWNED BY     g   ALTER SEQUENCE animals.habitat_visitantes_idhabitat_seq OWNED BY animals.habitat_visitantes.idhabitat;
          animals               adminzoo    false    282                       1259    16640 #   habitat_visitantes_idvisitantes_seq    SEQUENCE     �   CREATE SEQUENCE animals.habitat_visitantes_idvisitantes_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE animals.habitat_visitantes_idvisitantes_seq;
       animals               adminzoo    false    284    6            9           0    0 #   habitat_visitantes_idvisitantes_seq    SEQUENCE OWNED BY     m   ALTER SEQUENCE animals.habitat_visitantes_idvisitantes_seq OWNED BY animals.habitat_visitantes.idvisitantes;
          animals               adminzoo    false    283                       1259    16622    tipo_visitantes    TABLE     
  CREATE TABLE animals.tipo_visitantes (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    descuento numeric(5,2) NOT NULL,
    CONSTRAINT tipo_visitantes_descuento_check CHECK (((descuento >= (0)::numeric) AND (descuento <= (100)::numeric)))
);
 $   DROP TABLE animals.tipo_visitantes;
       animals         heap r       adminzoo    false    6                       1259    16621    tipo_visitantes_id_seq    SEQUENCE     �   CREATE SEQUENCE animals.tipo_visitantes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE animals.tipo_visitantes_id_seq;
       animals               adminzoo    false    277    6            :           0    0    tipo_visitantes_id_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE animals.tipo_visitantes_id_seq OWNED BY animals.tipo_visitantes.id;
          animals               adminzoo    false    276                       1259    16608 	   ubicacion    TABLE     g   CREATE TABLE animals.ubicacion (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);
    DROP TABLE animals.ubicacion;
       animals         heap r       adminzoo    false    6                       1259    16607    ubicacion_id_seq    SEQUENCE     �   CREATE SEQUENCE animals.ubicacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE animals.ubicacion_id_seq;
       animals               adminzoo    false    273    6            ;           0    0    ubicacion_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE animals.ubicacion_id_seq OWNED BY animals.ubicacion.id;
          animals               adminzoo    false    272                       1259    16631 
   visitantes    TABLE     �   CREATE TABLE animals.visitantes (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    idtipovisitante integer NOT NULL
);
    DROP TABLE animals.visitantes;
       animals         heap r       adminzoo    false    6                       1259    16629    visitantes_id_seq    SEQUENCE     �   CREATE SEQUENCE animals.visitantes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 )   DROP SEQUENCE animals.visitantes_id_seq;
       animals               adminzoo    false    280    6            <           0    0    visitantes_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE animals.visitantes_id_seq OWNED BY animals.visitantes.id;
          animals               adminzoo    false    278                       1259    16630    visitantes_idtipovisitante_seq    SEQUENCE     �   CREATE SEQUENCE animals.visitantes_idtipovisitante_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE animals.visitantes_idtipovisitante_seq;
       animals               adminzoo    false    6    280            =           0    0    visitantes_idtipovisitante_seq    SEQUENCE OWNED BY     c   ALTER SEQUENCE animals.visitantes_idtipovisitante_seq OWNED BY animals.visitantes.idtipovisitante;
          animals               adminzoo    false    279            �            1259    16397    animales    TABLE     �   CREATE TABLE public.animales (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    fechanac date,
    idcuidador integer NOT NULL,
    idhabitat integer NOT NULL,
    idespecie integer NOT NULL
);
    DROP TABLE public.animales;
       public         heap r       adminzoo    false            �            1259    16393    animales_id_seq    SEQUENCE     �   CREATE SEQUENCE public.animales_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.animales_id_seq;
       public               adminzoo    false    222            >           0    0    animales_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.animales_id_seq OWNED BY public.animales.id;
          public               adminzoo    false    218            �            1259    16394    animales_idcuidador_seq    SEQUENCE     �   CREATE SEQUENCE public.animales_idcuidador_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.animales_idcuidador_seq;
       public               adminzoo    false    222            ?           0    0    animales_idcuidador_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.animales_idcuidador_seq OWNED BY public.animales.idcuidador;
          public               adminzoo    false    219            �            1259    16396    animales_idespecie_seq    SEQUENCE     �   CREATE SEQUENCE public.animales_idespecie_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.animales_idespecie_seq;
       public               adminzoo    false    222            @           0    0    animales_idespecie_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.animales_idespecie_seq OWNED BY public.animales.idespecie;
          public               adminzoo    false    221            �            1259    16395    animales_idhabitat_seq    SEQUENCE     �   CREATE SEQUENCE public.animales_idhabitat_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.animales_idhabitat_seq;
       public               adminzoo    false    222            A           0    0    animales_idhabitat_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE public.animales_idhabitat_seq OWNED BY public.animales.idhabitat;
          public               adminzoo    false    220            �            1259    16466    clima    TABLE     b   CREATE TABLE public.clima (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);
    DROP TABLE public.clima;
       public         heap r       adminzoo    false            �            1259    16465    clima_id_seq    SEQUENCE     �   CREATE SEQUENCE public.clima_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE public.clima_id_seq;
       public               adminzoo    false    243            B           0    0    clima_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE public.clima_id_seq OWNED BY public.clima.id;
          public               adminzoo    false    242            �            1259    16408    cuidador    TABLE     �   CREATE TABLE public.cuidador (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    fechacontratacion date NOT NULL,
    idespecialidad integer NOT NULL
);
    DROP TABLE public.cuidador;
       public         heap r       adminzoo    false            �            1259    16406    cuidador_id_seq    SEQUENCE     �   CREATE SEQUENCE public.cuidador_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 &   DROP SEQUENCE public.cuidador_id_seq;
       public               adminzoo    false    225            C           0    0    cuidador_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE public.cuidador_id_seq OWNED BY public.cuidador.id;
          public               adminzoo    false    223            �            1259    16407    cuidador_idespecialidad_seq    SEQUENCE     �   CREATE SEQUENCE public.cuidador_idespecialidad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.cuidador_idespecialidad_seq;
       public               adminzoo    false    225            D           0    0    cuidador_idespecialidad_seq    SEQUENCE OWNED BY     [   ALTER SEQUENCE public.cuidador_idespecialidad_seq OWNED BY public.cuidador.idespecialidad;
          public               adminzoo    false    224            �            1259    16416    especialidad    TABLE     i   CREATE TABLE public.especialidad (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);
     DROP TABLE public.especialidad;
       public         heap r       adminzoo    false            �            1259    16415    especialidad_id_seq    SEQUENCE     �   CREATE SEQUENCE public.especialidad_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.especialidad_id_seq;
       public               adminzoo    false    227            E           0    0    especialidad_id_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.especialidad_id_seq OWNED BY public.especialidad.id;
          public               adminzoo    false    226            �            1259    16425    especie    TABLE     �   CREATE TABLE public.especie (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    idfamilia integer NOT NULL,
    idestadoconservacion integer NOT NULL
);
    DROP TABLE public.especie;
       public         heap r       adminzoo    false            �            1259    16422    especie_id_seq    SEQUENCE     �   CREATE SEQUENCE public.especie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.especie_id_seq;
       public               adminzoo    false    231            F           0    0    especie_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.especie_id_seq OWNED BY public.especie.id;
          public               adminzoo    false    228            �            1259    16424     especie_idestadoconservacion_seq    SEQUENCE     �   CREATE SEQUENCE public.especie_idestadoconservacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.especie_idestadoconservacion_seq;
       public               adminzoo    false    231            G           0    0     especie_idestadoconservacion_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.especie_idestadoconservacion_seq OWNED BY public.especie.idestadoconservacion;
          public               adminzoo    false    230            �            1259    16423    especie_idfamilia_seq    SEQUENCE     �   CREATE SEQUENCE public.especie_idfamilia_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.especie_idfamilia_seq;
       public               adminzoo    false    231            H           0    0    especie_idfamilia_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE public.especie_idfamilia_seq OWNED BY public.especie.idfamilia;
          public               adminzoo    false    229            �            1259    16441    estado_conservacion    TABLE     �   CREATE TABLE public.estado_conservacion (
    id integer NOT NULL,
    codigo character varying(2) NOT NULL,
    nombre character varying(50) NOT NULL,
    descripcion character varying(50) NOT NULL
);
 '   DROP TABLE public.estado_conservacion;
       public         heap r       adminzoo    false            �            1259    16440    estado_conservacion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.estado_conservacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.estado_conservacion_id_seq;
       public               adminzoo    false    235            I           0    0    estado_conservacion_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE public.estado_conservacion_id_seq OWNED BY public.estado_conservacion.id;
          public               adminzoo    false    234            �            1259    16434    familia    TABLE     �   CREATE TABLE public.familia (
    id integer NOT NULL,
    nombrecientifico character varying(50) NOT NULL,
    nombrecomun character varying(50) NOT NULL
);
    DROP TABLE public.familia;
       public         heap r       adminzoo    false            �            1259    16433    familia_id_seq    SEQUENCE     �   CREATE SEQUENCE public.familia_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.familia_id_seq;
       public               adminzoo    false    233            J           0    0    familia_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.familia_id_seq OWNED BY public.familia.id;
          public               adminzoo    false    232            �            1259    16450    habitat    TABLE     �   CREATE TABLE public.habitat (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    idubicacion integer NOT NULL,
    idclima integer NOT NULL
);
    DROP TABLE public.habitat;
       public         heap r       adminzoo    false            �            1259    16447    habitat_id_seq    SEQUENCE     �   CREATE SEQUENCE public.habitat_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 %   DROP SEQUENCE public.habitat_id_seq;
       public               adminzoo    false    239            K           0    0    habitat_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE public.habitat_id_seq OWNED BY public.habitat.id;
          public               adminzoo    false    236            �            1259    16449    habitat_idclima_seq    SEQUENCE     �   CREATE SEQUENCE public.habitat_idclima_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 *   DROP SEQUENCE public.habitat_idclima_seq;
       public               adminzoo    false    239            L           0    0    habitat_idclima_seq    SEQUENCE OWNED BY     K   ALTER SEQUENCE public.habitat_idclima_seq OWNED BY public.habitat.idclima;
          public               adminzoo    false    238            �            1259    16448    habitat_idubicacion_seq    SEQUENCE     �   CREATE SEQUENCE public.habitat_idubicacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.habitat_idubicacion_seq;
       public               adminzoo    false    239            M           0    0    habitat_idubicacion_seq    SEQUENCE OWNED BY     S   ALTER SEQUENCE public.habitat_idubicacion_seq OWNED BY public.habitat.idubicacion;
          public               adminzoo    false    237            �            1259    16482    habitat_visitantes    TABLE     �   CREATE TABLE public.habitat_visitantes (
    id integer NOT NULL,
    idhabitat integer NOT NULL,
    idvisitantes integer NOT NULL
);
 &   DROP TABLE public.habitat_visitantes;
       public         heap r       adminzoo    false            �            1259    16479    habitat_visitantes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.habitat_visitantes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.habitat_visitantes_id_seq;
       public               adminzoo    false    249            N           0    0    habitat_visitantes_id_seq    SEQUENCE OWNED BY     W   ALTER SEQUENCE public.habitat_visitantes_id_seq OWNED BY public.habitat_visitantes.id;
          public               adminzoo    false    246            �            1259    16480     habitat_visitantes_idhabitat_seq    SEQUENCE     �   CREATE SEQUENCE public.habitat_visitantes_idhabitat_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 7   DROP SEQUENCE public.habitat_visitantes_idhabitat_seq;
       public               adminzoo    false    249            O           0    0     habitat_visitantes_idhabitat_seq    SEQUENCE OWNED BY     e   ALTER SEQUENCE public.habitat_visitantes_idhabitat_seq OWNED BY public.habitat_visitantes.idhabitat;
          public               adminzoo    false    247            �            1259    16481 #   habitat_visitantes_idvisitantes_seq    SEQUENCE     �   CREATE SEQUENCE public.habitat_visitantes_idvisitantes_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 :   DROP SEQUENCE public.habitat_visitantes_idvisitantes_seq;
       public               adminzoo    false    249            P           0    0 #   habitat_visitantes_idvisitantes_seq    SEQUENCE OWNED BY     k   ALTER SEQUENCE public.habitat_visitantes_idvisitantes_seq OWNED BY public.habitat_visitantes.idvisitantes;
          public               adminzoo    false    248            �            1259    16459 	   ubicacion    TABLE     f   CREATE TABLE public.ubicacion (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL
);
    DROP TABLE public.ubicacion;
       public         heap r       adminzoo    false            �            1259    16458    ubicacion_id_seq    SEQUENCE     �   CREATE SEQUENCE public.ubicacion_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.ubicacion_id_seq;
       public               adminzoo    false    241            Q           0    0    ubicacion_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE public.ubicacion_id_seq OWNED BY public.ubicacion.id;
          public               adminzoo    false    240            �            1259    16473 
   visitantes    TABLE     }   CREATE TABLE public.visitantes (
    id integer NOT NULL,
    nombre character varying(50) NOT NULL,
    fechavisita date
);
    DROP TABLE public.visitantes;
       public         heap r       adminzoo    false            �            1259    16472    visitantes_id_seq    SEQUENCE     �   CREATE SEQUENCE public.visitantes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.visitantes_id_seq;
       public               adminzoo    false    245            R           0    0    visitantes_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE public.visitantes_id_seq OWNED BY public.visitantes.id;
          public               adminzoo    false    244            �           2604    16549    animales id    DEFAULT     l   ALTER TABLE ONLY animals.animales ALTER COLUMN id SET DEFAULT nextval('animals.animales_id_seq'::regclass);
 ;   ALTER TABLE animals.animales ALTER COLUMN id DROP DEFAULT;
       animals               adminzoo    false    254    250    254            �           2604    16550    animales idcuidador    DEFAULT     |   ALTER TABLE ONLY animals.animales ALTER COLUMN idcuidador SET DEFAULT nextval('animals.animales_idcuidador_seq'::regclass);
 C   ALTER TABLE animals.animales ALTER COLUMN idcuidador DROP DEFAULT;
       animals               adminzoo    false    254    251    254            �           2604    16551    animales idhabitat    DEFAULT     z   ALTER TABLE ONLY animals.animales ALTER COLUMN idhabitat SET DEFAULT nextval('animals.animales_idhabitat_seq'::regclass);
 B   ALTER TABLE animals.animales ALTER COLUMN idhabitat DROP DEFAULT;
       animals               adminzoo    false    254    252    254            �           2604    16552    animales idespecie    DEFAULT     z   ALTER TABLE ONLY animals.animales ALTER COLUMN idespecie SET DEFAULT nextval('animals.animales_idespecie_seq'::regclass);
 B   ALTER TABLE animals.animales ALTER COLUMN idespecie DROP DEFAULT;
       animals               adminzoo    false    253    254    254                       2604    16618    clima id    DEFAULT     f   ALTER TABLE ONLY animals.clima ALTER COLUMN id SET DEFAULT nextval('animals.clima_id_seq'::regclass);
 8   ALTER TABLE animals.clima ALTER COLUMN id DROP DEFAULT;
       animals               adminzoo    false    275    274    275            �           2604    16560    cuidador id    DEFAULT     l   ALTER TABLE ONLY animals.cuidador ALTER COLUMN id SET DEFAULT nextval('animals.cuidador_id_seq'::regclass);
 ;   ALTER TABLE animals.cuidador ALTER COLUMN id DROP DEFAULT;
       animals               adminzoo    false    257    255    257            �           2604    16561    cuidador idespecialidad    DEFAULT     �   ALTER TABLE ONLY animals.cuidador ALTER COLUMN idespecialidad SET DEFAULT nextval('animals.cuidador_idespecialidad_seq'::regclass);
 G   ALTER TABLE animals.cuidador ALTER COLUMN idespecialidad DROP DEFAULT;
       animals               adminzoo    false    257    256    257            �           2604    16568    especialidad id    DEFAULT     t   ALTER TABLE ONLY animals.especialidad ALTER COLUMN id SET DEFAULT nextval('animals.especialidad_id_seq'::regclass);
 ?   ALTER TABLE animals.especialidad ALTER COLUMN id DROP DEFAULT;
       animals               adminzoo    false    259    258    259            �           2604    16577 
   especie id    DEFAULT     j   ALTER TABLE ONLY animals.especie ALTER COLUMN id SET DEFAULT nextval('animals.especie_id_seq'::regclass);
 :   ALTER TABLE animals.especie ALTER COLUMN id DROP DEFAULT;
       animals               adminzoo    false    260    263    263            �           2604    16578    especie idfamilia    DEFAULT     x   ALTER TABLE ONLY animals.especie ALTER COLUMN idfamilia SET DEFAULT nextval('animals.especie_idfamilia_seq'::regclass);
 A   ALTER TABLE animals.especie ALTER COLUMN idfamilia DROP DEFAULT;
       animals               adminzoo    false    263    261    263            �           2604    16579    especie idestadoconservacion    DEFAULT     �   ALTER TABLE ONLY animals.especie ALTER COLUMN idestadoconservacion SET DEFAULT nextval('animals.especie_idestadoconservacion_seq'::regclass);
 L   ALTER TABLE animals.especie ALTER COLUMN idestadoconservacion DROP DEFAULT;
       animals               adminzoo    false    263    262    263            �           2604    16593    estado_conservacion id    DEFAULT     �   ALTER TABLE ONLY animals.estado_conservacion ALTER COLUMN id SET DEFAULT nextval('animals.estado_conservacion_id_seq'::regclass);
 F   ALTER TABLE animals.estado_conservacion ALTER COLUMN id DROP DEFAULT;
       animals               adminzoo    false    267    266    267            �           2604    16586 
   familia id    DEFAULT     j   ALTER TABLE ONLY animals.familia ALTER COLUMN id SET DEFAULT nextval('animals.familia_id_seq'::regclass);
 :   ALTER TABLE animals.familia ALTER COLUMN id DROP DEFAULT;
       animals               adminzoo    false    265    264    265            �           2604    16602 
   habitat id    DEFAULT     j   ALTER TABLE ONLY animals.habitat ALTER COLUMN id SET DEFAULT nextval('animals.habitat_id_seq'::regclass);
 :   ALTER TABLE animals.habitat ALTER COLUMN id DROP DEFAULT;
       animals               adminzoo    false    268    271    271            �           2604    16603    habitat idubicacion    DEFAULT     |   ALTER TABLE ONLY animals.habitat ALTER COLUMN idubicacion SET DEFAULT nextval('animals.habitat_idubicacion_seq'::regclass);
 C   ALTER TABLE animals.habitat ALTER COLUMN idubicacion DROP DEFAULT;
       animals               adminzoo    false    269    271    271                        2604    16604    habitat idclima    DEFAULT     t   ALTER TABLE ONLY animals.habitat ALTER COLUMN idclima SET DEFAULT nextval('animals.habitat_idclima_seq'::regclass);
 ?   ALTER TABLE animals.habitat ALTER COLUMN idclima DROP DEFAULT;
       animals               adminzoo    false    270    271    271                       2604    16644    habitat_visitantes id    DEFAULT     �   ALTER TABLE ONLY animals.habitat_visitantes ALTER COLUMN id SET DEFAULT nextval('animals.habitat_visitantes_id_seq'::regclass);
 E   ALTER TABLE animals.habitat_visitantes ALTER COLUMN id DROP DEFAULT;
       animals               adminzoo    false    281    284    284                       2604    16645    habitat_visitantes idhabitat    DEFAULT     �   ALTER TABLE ONLY animals.habitat_visitantes ALTER COLUMN idhabitat SET DEFAULT nextval('animals.habitat_visitantes_idhabitat_seq'::regclass);
 L   ALTER TABLE animals.habitat_visitantes ALTER COLUMN idhabitat DROP DEFAULT;
       animals               adminzoo    false    282    284    284                       2604    16646    habitat_visitantes idvisitantes    DEFAULT     �   ALTER TABLE ONLY animals.habitat_visitantes ALTER COLUMN idvisitantes SET DEFAULT nextval('animals.habitat_visitantes_idvisitantes_seq'::regclass);
 O   ALTER TABLE animals.habitat_visitantes ALTER COLUMN idvisitantes DROP DEFAULT;
       animals               adminzoo    false    283    284    284                       2604    16625    tipo_visitantes id    DEFAULT     z   ALTER TABLE ONLY animals.tipo_visitantes ALTER COLUMN id SET DEFAULT nextval('animals.tipo_visitantes_id_seq'::regclass);
 B   ALTER TABLE animals.tipo_visitantes ALTER COLUMN id DROP DEFAULT;
       animals               adminzoo    false    277    276    277                       2604    16611    ubicacion id    DEFAULT     n   ALTER TABLE ONLY animals.ubicacion ALTER COLUMN id SET DEFAULT nextval('animals.ubicacion_id_seq'::regclass);
 <   ALTER TABLE animals.ubicacion ALTER COLUMN id DROP DEFAULT;
       animals               adminzoo    false    272    273    273                       2604    16634    visitantes id    DEFAULT     p   ALTER TABLE ONLY animals.visitantes ALTER COLUMN id SET DEFAULT nextval('animals.visitantes_id_seq'::regclass);
 =   ALTER TABLE animals.visitantes ALTER COLUMN id DROP DEFAULT;
       animals               adminzoo    false    280    278    280                       2604    16635    visitantes idtipovisitante    DEFAULT     �   ALTER TABLE ONLY animals.visitantes ALTER COLUMN idtipovisitante SET DEFAULT nextval('animals.visitantes_idtipovisitante_seq'::regclass);
 J   ALTER TABLE animals.visitantes ALTER COLUMN idtipovisitante DROP DEFAULT;
       animals               adminzoo    false    279    280    280            �           2604    16400    animales id    DEFAULT     j   ALTER TABLE ONLY public.animales ALTER COLUMN id SET DEFAULT nextval('public.animales_id_seq'::regclass);
 :   ALTER TABLE public.animales ALTER COLUMN id DROP DEFAULT;
       public               adminzoo    false    218    222    222            �           2604    16401    animales idcuidador    DEFAULT     z   ALTER TABLE ONLY public.animales ALTER COLUMN idcuidador SET DEFAULT nextval('public.animales_idcuidador_seq'::regclass);
 B   ALTER TABLE public.animales ALTER COLUMN idcuidador DROP DEFAULT;
       public               adminzoo    false    222    219    222            �           2604    16402    animales idhabitat    DEFAULT     x   ALTER TABLE ONLY public.animales ALTER COLUMN idhabitat SET DEFAULT nextval('public.animales_idhabitat_seq'::regclass);
 A   ALTER TABLE public.animales ALTER COLUMN idhabitat DROP DEFAULT;
       public               adminzoo    false    220    222    222            �           2604    16403    animales idespecie    DEFAULT     x   ALTER TABLE ONLY public.animales ALTER COLUMN idespecie SET DEFAULT nextval('public.animales_idespecie_seq'::regclass);
 A   ALTER TABLE public.animales ALTER COLUMN idespecie DROP DEFAULT;
       public               adminzoo    false    222    221    222            �           2604    16469    clima id    DEFAULT     d   ALTER TABLE ONLY public.clima ALTER COLUMN id SET DEFAULT nextval('public.clima_id_seq'::regclass);
 7   ALTER TABLE public.clima ALTER COLUMN id DROP DEFAULT;
       public               adminzoo    false    242    243    243            �           2604    16411    cuidador id    DEFAULT     j   ALTER TABLE ONLY public.cuidador ALTER COLUMN id SET DEFAULT nextval('public.cuidador_id_seq'::regclass);
 :   ALTER TABLE public.cuidador ALTER COLUMN id DROP DEFAULT;
       public               adminzoo    false    223    225    225            �           2604    16412    cuidador idespecialidad    DEFAULT     �   ALTER TABLE ONLY public.cuidador ALTER COLUMN idespecialidad SET DEFAULT nextval('public.cuidador_idespecialidad_seq'::regclass);
 F   ALTER TABLE public.cuidador ALTER COLUMN idespecialidad DROP DEFAULT;
       public               adminzoo    false    225    224    225            �           2604    16419    especialidad id    DEFAULT     r   ALTER TABLE ONLY public.especialidad ALTER COLUMN id SET DEFAULT nextval('public.especialidad_id_seq'::regclass);
 >   ALTER TABLE public.especialidad ALTER COLUMN id DROP DEFAULT;
       public               adminzoo    false    226    227    227            �           2604    16428 
   especie id    DEFAULT     h   ALTER TABLE ONLY public.especie ALTER COLUMN id SET DEFAULT nextval('public.especie_id_seq'::regclass);
 9   ALTER TABLE public.especie ALTER COLUMN id DROP DEFAULT;
       public               adminzoo    false    231    228    231            �           2604    16429    especie idfamilia    DEFAULT     v   ALTER TABLE ONLY public.especie ALTER COLUMN idfamilia SET DEFAULT nextval('public.especie_idfamilia_seq'::regclass);
 @   ALTER TABLE public.especie ALTER COLUMN idfamilia DROP DEFAULT;
       public               adminzoo    false    229    231    231            �           2604    16430    especie idestadoconservacion    DEFAULT     �   ALTER TABLE ONLY public.especie ALTER COLUMN idestadoconservacion SET DEFAULT nextval('public.especie_idestadoconservacion_seq'::regclass);
 K   ALTER TABLE public.especie ALTER COLUMN idestadoconservacion DROP DEFAULT;
       public               adminzoo    false    231    230    231            �           2604    16444    estado_conservacion id    DEFAULT     �   ALTER TABLE ONLY public.estado_conservacion ALTER COLUMN id SET DEFAULT nextval('public.estado_conservacion_id_seq'::regclass);
 E   ALTER TABLE public.estado_conservacion ALTER COLUMN id DROP DEFAULT;
       public               adminzoo    false    234    235    235            �           2604    16437 
   familia id    DEFAULT     h   ALTER TABLE ONLY public.familia ALTER COLUMN id SET DEFAULT nextval('public.familia_id_seq'::regclass);
 9   ALTER TABLE public.familia ALTER COLUMN id DROP DEFAULT;
       public               adminzoo    false    233    232    233            �           2604    16453 
   habitat id    DEFAULT     h   ALTER TABLE ONLY public.habitat ALTER COLUMN id SET DEFAULT nextval('public.habitat_id_seq'::regclass);
 9   ALTER TABLE public.habitat ALTER COLUMN id DROP DEFAULT;
       public               adminzoo    false    239    236    239            �           2604    16454    habitat idubicacion    DEFAULT     z   ALTER TABLE ONLY public.habitat ALTER COLUMN idubicacion SET DEFAULT nextval('public.habitat_idubicacion_seq'::regclass);
 B   ALTER TABLE public.habitat ALTER COLUMN idubicacion DROP DEFAULT;
       public               adminzoo    false    237    239    239            �           2604    16455    habitat idclima    DEFAULT     r   ALTER TABLE ONLY public.habitat ALTER COLUMN idclima SET DEFAULT nextval('public.habitat_idclima_seq'::regclass);
 >   ALTER TABLE public.habitat ALTER COLUMN idclima DROP DEFAULT;
       public               adminzoo    false    239    238    239            �           2604    16485    habitat_visitantes id    DEFAULT     ~   ALTER TABLE ONLY public.habitat_visitantes ALTER COLUMN id SET DEFAULT nextval('public.habitat_visitantes_id_seq'::regclass);
 D   ALTER TABLE public.habitat_visitantes ALTER COLUMN id DROP DEFAULT;
       public               adminzoo    false    249    246    249            �           2604    16486    habitat_visitantes idhabitat    DEFAULT     �   ALTER TABLE ONLY public.habitat_visitantes ALTER COLUMN idhabitat SET DEFAULT nextval('public.habitat_visitantes_idhabitat_seq'::regclass);
 K   ALTER TABLE public.habitat_visitantes ALTER COLUMN idhabitat DROP DEFAULT;
       public               adminzoo    false    247    249    249            �           2604    16487    habitat_visitantes idvisitantes    DEFAULT     �   ALTER TABLE ONLY public.habitat_visitantes ALTER COLUMN idvisitantes SET DEFAULT nextval('public.habitat_visitantes_idvisitantes_seq'::regclass);
 N   ALTER TABLE public.habitat_visitantes ALTER COLUMN idvisitantes DROP DEFAULT;
       public               adminzoo    false    249    248    249            �           2604    16462    ubicacion id    DEFAULT     l   ALTER TABLE ONLY public.ubicacion ALTER COLUMN id SET DEFAULT nextval('public.ubicacion_id_seq'::regclass);
 ;   ALTER TABLE public.ubicacion ALTER COLUMN id DROP DEFAULT;
       public               adminzoo    false    241    240    241            �           2604    16476    visitantes id    DEFAULT     n   ALTER TABLE ONLY public.visitantes ALTER COLUMN id SET DEFAULT nextval('public.visitantes_id_seq'::regclass);
 <   ALTER TABLE public.visitantes ALTER COLUMN id DROP DEFAULT;
       public               adminzoo    false    244    245    245                      0    16546    animales 
   TABLE DATA           [   COPY animals.animales (id, nombre, fechanac, idcuidador, idhabitat, idespecie) FROM stdin;
    animals               adminzoo    false    254   �D                0    16615    clima 
   TABLE DATA           ,   COPY animals.clima (id, nombre) FROM stdin;
    animals               adminzoo    false    275   mI                0    16557    cuidador 
   TABLE DATA           [   COPY animals.cuidador (id, nombre, fechacontratacion, salario, idespecialidad) FROM stdin;
    animals               adminzoo    false    257   J                0    16565    especialidad 
   TABLE DATA           3   COPY animals.especialidad (id, nombre) FROM stdin;
    animals               adminzoo    false    259   �K                0    16574    especie 
   TABLE DATA           O   COPY animals.especie (id, nombre, idfamilia, idestadoconservacion) FROM stdin;
    animals               adminzoo    false    263   �L                0    16590    estado_conservacion 
   TABLE DATA           O   COPY animals.estado_conservacion (id, codigo, nombre, descripcion) FROM stdin;
    animals               adminzoo    false    267   �O                0    16583    familia 
   TABLE DATA           E   COPY animals.familia (id, nombrecientifico, nombrecomun) FROM stdin;
    animals               adminzoo    false    265   Q                0    16599    habitat 
   TABLE DATA           O   COPY animals.habitat (id, nombre, idubicacion, costobase, idclima) FROM stdin;
    animals               adminzoo    false    271   �R                 0    16641    habitat_visitantes 
   TABLE DATA           c   COPY animals.habitat_visitantes (id, idhabitat, idvisitantes, costofinal, fechavisita) FROM stdin;
    animals               adminzoo    false    284   �T                0    16622    tipo_visitantes 
   TABLE DATA           A   COPY animals.tipo_visitantes (id, nombre, descuento) FROM stdin;
    animals               adminzoo    false    277   �T                0    16608 	   ubicacion 
   TABLE DATA           0   COPY animals.ubicacion (id, nombre) FROM stdin;
    animals               adminzoo    false    273   .U                0    16631 
   visitantes 
   TABLE DATA           B   COPY animals.visitantes (id, nombre, idtipovisitante) FROM stdin;
    animals               adminzoo    false    280   =V      �          0    16397    animales 
   TABLE DATA           Z   COPY public.animales (id, nombre, fechanac, idcuidador, idhabitat, idespecie) FROM stdin;
    public               adminzoo    false    222   n�      �          0    16466    clima 
   TABLE DATA           +   COPY public.clima (id, nombre) FROM stdin;
    public               adminzoo    false    243   4�      �          0    16408    cuidador 
   TABLE DATA           Q   COPY public.cuidador (id, nombre, fechacontratacion, idespecialidad) FROM stdin;
    public               adminzoo    false    225   Ҏ      �          0    16416    especialidad 
   TABLE DATA           2   COPY public.especialidad (id, nombre) FROM stdin;
    public               adminzoo    false    227   ~�      �          0    16425    especie 
   TABLE DATA           N   COPY public.especie (id, nombre, idfamilia, idestadoconservacion) FROM stdin;
    public               adminzoo    false    231   o�      �          0    16441    estado_conservacion 
   TABLE DATA           N   COPY public.estado_conservacion (id, codigo, nombre, descripcion) FROM stdin;
    public               adminzoo    false    235   g�      �          0    16434    familia 
   TABLE DATA           D   COPY public.familia (id, nombrecientifico, nombrecomun) FROM stdin;
    public               adminzoo    false    233   ��      �          0    16450    habitat 
   TABLE DATA           C   COPY public.habitat (id, nombre, idubicacion, idclima) FROM stdin;
    public               adminzoo    false    239   �      �          0    16482    habitat_visitantes 
   TABLE DATA           I   COPY public.habitat_visitantes (id, idhabitat, idvisitantes) FROM stdin;
    public               adminzoo    false    249   ��      �          0    16459 	   ubicacion 
   TABLE DATA           /   COPY public.ubicacion (id, nombre) FROM stdin;
    public               adminzoo    false    241   �      �          0    16473 
   visitantes 
   TABLE DATA           =   COPY public.visitantes (id, nombre, fechavisita) FROM stdin;
    public               adminzoo    false    245   ��      S           0    0    animales_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('animals.animales_id_seq', 95, true);
          animals               adminzoo    false    250            T           0    0    animales_idcuidador_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('animals.animales_idcuidador_seq', 1, false);
          animals               adminzoo    false    251            U           0    0    animales_idespecie_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('animals.animales_idespecie_seq', 1, false);
          animals               adminzoo    false    253            V           0    0    animales_idhabitat_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('animals.animales_idhabitat_seq', 1, false);
          animals               adminzoo    false    252            W           0    0    clima_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('animals.clima_id_seq', 15, true);
          animals               adminzoo    false    274            X           0    0    cuidador_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('animals.cuidador_id_seq', 20, true);
          animals               adminzoo    false    255            Y           0    0    cuidador_idespecialidad_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('animals.cuidador_idespecialidad_seq', 1, false);
          animals               adminzoo    false    256            Z           0    0    especialidad_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('animals.especialidad_id_seq', 15, true);
          animals               adminzoo    false    258            [           0    0    especie_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('animals.especie_id_seq', 63, true);
          animals               adminzoo    false    260            \           0    0     especie_idestadoconservacion_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('animals.especie_idestadoconservacion_seq', 1, false);
          animals               adminzoo    false    262            ]           0    0    especie_idfamilia_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('animals.especie_idfamilia_seq', 1, false);
          animals               adminzoo    false    261            ^           0    0    estado_conservacion_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('animals.estado_conservacion_id_seq', 9, true);
          animals               adminzoo    false    266            _           0    0    familia_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('animals.familia_id_seq', 22, true);
          animals               adminzoo    false    264            `           0    0    habitat_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('animals.habitat_id_seq', 23, true);
          animals               adminzoo    false    268            a           0    0    habitat_idclima_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('animals.habitat_idclima_seq', 1, false);
          animals               adminzoo    false    270            b           0    0    habitat_idubicacion_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('animals.habitat_idubicacion_seq', 1, false);
          animals               adminzoo    false    269            c           0    0    habitat_visitantes_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('animals.habitat_visitantes_id_seq', 1, false);
          animals               adminzoo    false    281            d           0    0     habitat_visitantes_idhabitat_seq    SEQUENCE SET     P   SELECT pg_catalog.setval('animals.habitat_visitantes_idhabitat_seq', 1, false);
          animals               adminzoo    false    282            e           0    0 #   habitat_visitantes_idvisitantes_seq    SEQUENCE SET     S   SELECT pg_catalog.setval('animals.habitat_visitantes_idvisitantes_seq', 1, false);
          animals               adminzoo    false    283            f           0    0    tipo_visitantes_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('animals.tipo_visitantes_id_seq', 5, true);
          animals               adminzoo    false    276            g           0    0    ubicacion_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('animals.ubicacion_id_seq', 20, true);
          animals               adminzoo    false    272            h           0    0    visitantes_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('animals.visitantes_id_seq', 1000, true);
          animals               adminzoo    false    278            i           0    0    visitantes_idtipovisitante_seq    SEQUENCE SET     N   SELECT pg_catalog.setval('animals.visitantes_idtipovisitante_seq', 1, false);
          animals               adminzoo    false    279            j           0    0    animales_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.animales_id_seq', 94, true);
          public               adminzoo    false    218            k           0    0    animales_idcuidador_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.animales_idcuidador_seq', 1, false);
          public               adminzoo    false    219            l           0    0    animales_idespecie_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.animales_idespecie_seq', 1, false);
          public               adminzoo    false    221            m           0    0    animales_idhabitat_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('public.animales_idhabitat_seq', 1, false);
          public               adminzoo    false    220            n           0    0    clima_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('public.clima_id_seq', 15, true);
          public               adminzoo    false    242            o           0    0    cuidador_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('public.cuidador_id_seq', 20, true);
          public               adminzoo    false    223            p           0    0    cuidador_idespecialidad_seq    SEQUENCE SET     J   SELECT pg_catalog.setval('public.cuidador_idespecialidad_seq', 1, false);
          public               adminzoo    false    224            q           0    0    especialidad_id_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.especialidad_id_seq', 15, true);
          public               adminzoo    false    226            r           0    0    especie_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.especie_id_seq', 63, true);
          public               adminzoo    false    228            s           0    0     especie_idestadoconservacion_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.especie_idestadoconservacion_seq', 1, false);
          public               adminzoo    false    230            t           0    0    especie_idfamilia_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('public.especie_idfamilia_seq', 1, false);
          public               adminzoo    false    229            u           0    0    estado_conservacion_id_seq    SEQUENCE SET     H   SELECT pg_catalog.setval('public.estado_conservacion_id_seq', 9, true);
          public               adminzoo    false    234            v           0    0    familia_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.familia_id_seq', 22, true);
          public               adminzoo    false    232            w           0    0    habitat_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('public.habitat_id_seq', 23, true);
          public               adminzoo    false    236            x           0    0    habitat_idclima_seq    SEQUENCE SET     B   SELECT pg_catalog.setval('public.habitat_idclima_seq', 1, false);
          public               adminzoo    false    238            y           0    0    habitat_idubicacion_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('public.habitat_idubicacion_seq', 1, false);
          public               adminzoo    false    237            z           0    0    habitat_visitantes_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('public.habitat_visitantes_id_seq', 800, true);
          public               adminzoo    false    246            {           0    0     habitat_visitantes_idhabitat_seq    SEQUENCE SET     O   SELECT pg_catalog.setval('public.habitat_visitantes_idhabitat_seq', 1, false);
          public               adminzoo    false    247            |           0    0 #   habitat_visitantes_idvisitantes_seq    SEQUENCE SET     R   SELECT pg_catalog.setval('public.habitat_visitantes_idvisitantes_seq', 1, false);
          public               adminzoo    false    248            }           0    0    ubicacion_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('public.ubicacion_id_seq', 20, true);
          public               adminzoo    false    240            ~           0    0    visitantes_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('public.visitantes_id_seq', 300, true);
          public               adminzoo    false    244            !           2606    16554    animales animales_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY animals.animales
    ADD CONSTRAINT animales_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY animals.animales DROP CONSTRAINT animales_pkey;
       animals                 adminzoo    false    254            1           2606    16620    clima clima_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY animals.clima
    ADD CONSTRAINT clima_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY animals.clima DROP CONSTRAINT clima_pkey;
       animals                 adminzoo    false    275            #           2606    16563    cuidador cuidador_pkey 
   CONSTRAINT     U   ALTER TABLE ONLY animals.cuidador
    ADD CONSTRAINT cuidador_pkey PRIMARY KEY (id);
 A   ALTER TABLE ONLY animals.cuidador DROP CONSTRAINT cuidador_pkey;
       animals                 adminzoo    false    257            %           2606    16570    especialidad especialidad_pkey 
   CONSTRAINT     ]   ALTER TABLE ONLY animals.especialidad
    ADD CONSTRAINT especialidad_pkey PRIMARY KEY (id);
 I   ALTER TABLE ONLY animals.especialidad DROP CONSTRAINT especialidad_pkey;
       animals                 adminzoo    false    259            '           2606    16581    especie especie_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY animals.especie
    ADD CONSTRAINT especie_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY animals.especie DROP CONSTRAINT especie_pkey;
       animals                 adminzoo    false    263            +           2606    16595 ,   estado_conservacion estado_conservacion_pkey 
   CONSTRAINT     k   ALTER TABLE ONLY animals.estado_conservacion
    ADD CONSTRAINT estado_conservacion_pkey PRIMARY KEY (id);
 W   ALTER TABLE ONLY animals.estado_conservacion DROP CONSTRAINT estado_conservacion_pkey;
       animals                 adminzoo    false    267            )           2606    16588    familia familia_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY animals.familia
    ADD CONSTRAINT familia_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY animals.familia DROP CONSTRAINT familia_pkey;
       animals                 adminzoo    false    265            -           2606    16606    habitat habitat_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY animals.habitat
    ADD CONSTRAINT habitat_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY animals.habitat DROP CONSTRAINT habitat_pkey;
       animals                 adminzoo    false    271            7           2606    16648 *   habitat_visitantes habitat_visitantes_pkey 
   CONSTRAINT     i   ALTER TABLE ONLY animals.habitat_visitantes
    ADD CONSTRAINT habitat_visitantes_pkey PRIMARY KEY (id);
 U   ALTER TABLE ONLY animals.habitat_visitantes DROP CONSTRAINT habitat_visitantes_pkey;
       animals                 adminzoo    false    284            3           2606    16628 $   tipo_visitantes tipo_visitantes_pkey 
   CONSTRAINT     c   ALTER TABLE ONLY animals.tipo_visitantes
    ADD CONSTRAINT tipo_visitantes_pkey PRIMARY KEY (id);
 O   ALTER TABLE ONLY animals.tipo_visitantes DROP CONSTRAINT tipo_visitantes_pkey;
       animals                 adminzoo    false    277            /           2606    16613    ubicacion ubicacion_pkey 
   CONSTRAINT     W   ALTER TABLE ONLY animals.ubicacion
    ADD CONSTRAINT ubicacion_pkey PRIMARY KEY (id);
 C   ALTER TABLE ONLY animals.ubicacion DROP CONSTRAINT ubicacion_pkey;
       animals                 adminzoo    false    273            5           2606    16637    visitantes visitantes_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY animals.visitantes
    ADD CONSTRAINT visitantes_pkey PRIMARY KEY (id);
 E   ALTER TABLE ONLY animals.visitantes DROP CONSTRAINT visitantes_pkey;
       animals                 adminzoo    false    280                       2606    16405    animales animales_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.animales
    ADD CONSTRAINT animales_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.animales DROP CONSTRAINT animales_pkey;
       public                 adminzoo    false    222                       2606    16471    clima clima_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.clima
    ADD CONSTRAINT clima_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.clima DROP CONSTRAINT clima_pkey;
       public                 adminzoo    false    243                       2606    16414    cuidador cuidador_pkey 
   CONSTRAINT     T   ALTER TABLE ONLY public.cuidador
    ADD CONSTRAINT cuidador_pkey PRIMARY KEY (id);
 @   ALTER TABLE ONLY public.cuidador DROP CONSTRAINT cuidador_pkey;
       public                 adminzoo    false    225                       2606    16421    especialidad especialidad_pkey 
   CONSTRAINT     \   ALTER TABLE ONLY public.especialidad
    ADD CONSTRAINT especialidad_pkey PRIMARY KEY (id);
 H   ALTER TABLE ONLY public.especialidad DROP CONSTRAINT especialidad_pkey;
       public                 adminzoo    false    227                       2606    16432    especie especie_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.especie
    ADD CONSTRAINT especie_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.especie DROP CONSTRAINT especie_pkey;
       public                 adminzoo    false    231                       2606    16446 ,   estado_conservacion estado_conservacion_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY public.estado_conservacion
    ADD CONSTRAINT estado_conservacion_pkey PRIMARY KEY (id);
 V   ALTER TABLE ONLY public.estado_conservacion DROP CONSTRAINT estado_conservacion_pkey;
       public                 adminzoo    false    235                       2606    16439    familia familia_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.familia
    ADD CONSTRAINT familia_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.familia DROP CONSTRAINT familia_pkey;
       public                 adminzoo    false    233                       2606    16457    habitat habitat_pkey 
   CONSTRAINT     R   ALTER TABLE ONLY public.habitat
    ADD CONSTRAINT habitat_pkey PRIMARY KEY (id);
 >   ALTER TABLE ONLY public.habitat DROP CONSTRAINT habitat_pkey;
       public                 adminzoo    false    239                       2606    16489 *   habitat_visitantes habitat_visitantes_pkey 
   CONSTRAINT     h   ALTER TABLE ONLY public.habitat_visitantes
    ADD CONSTRAINT habitat_visitantes_pkey PRIMARY KEY (id);
 T   ALTER TABLE ONLY public.habitat_visitantes DROP CONSTRAINT habitat_visitantes_pkey;
       public                 adminzoo    false    249                       2606    16464    ubicacion ubicacion_pkey 
   CONSTRAINT     V   ALTER TABLE ONLY public.ubicacion
    ADD CONSTRAINT ubicacion_pkey PRIMARY KEY (id);
 B   ALTER TABLE ONLY public.ubicacion DROP CONSTRAINT ubicacion_pkey;
       public                 adminzoo    false    241                       2606    16478    visitantes visitantes_pkey 
   CONSTRAINT     X   ALTER TABLE ONLY public.visitantes
    ADD CONSTRAINT visitantes_pkey PRIMARY KEY (id);
 D   ALTER TABLE ONLY public.visitantes DROP CONSTRAINT visitantes_pkey;
       public                 adminzoo    false    245            B           2606    16649 !   animales animales_idcuidador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY animals.animales
    ADD CONSTRAINT animales_idcuidador_fkey FOREIGN KEY (idcuidador) REFERENCES animals.cuidador(id);
 L   ALTER TABLE ONLY animals.animales DROP CONSTRAINT animales_idcuidador_fkey;
       animals               adminzoo    false    257    4899    254            C           2606    16659     animales animales_idespecie_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY animals.animales
    ADD CONSTRAINT animales_idespecie_fkey FOREIGN KEY (idespecie) REFERENCES animals.especie(id);
 K   ALTER TABLE ONLY animals.animales DROP CONSTRAINT animales_idespecie_fkey;
       animals               adminzoo    false    263    254    4903            D           2606    16654     animales animales_idhabitat_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY animals.animales
    ADD CONSTRAINT animales_idhabitat_fkey FOREIGN KEY (idhabitat) REFERENCES animals.habitat(id);
 K   ALTER TABLE ONLY animals.animales DROP CONSTRAINT animales_idhabitat_fkey;
       animals               adminzoo    false    271    4909    254            E           2606    16664 %   cuidador cuidador_idespecialidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY animals.cuidador
    ADD CONSTRAINT cuidador_idespecialidad_fkey FOREIGN KEY (idespecialidad) REFERENCES animals.especialidad(id);
 P   ALTER TABLE ONLY animals.cuidador DROP CONSTRAINT cuidador_idespecialidad_fkey;
       animals               adminzoo    false    259    257    4901            F           2606    16674 )   especie especie_idestadoconservacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY animals.especie
    ADD CONSTRAINT especie_idestadoconservacion_fkey FOREIGN KEY (idestadoconservacion) REFERENCES animals.estado_conservacion(id);
 T   ALTER TABLE ONLY animals.especie DROP CONSTRAINT especie_idestadoconservacion_fkey;
       animals               adminzoo    false    263    267    4907            G           2606    16669    especie especie_idfamilia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY animals.especie
    ADD CONSTRAINT especie_idfamilia_fkey FOREIGN KEY (idfamilia) REFERENCES animals.familia(id);
 I   ALTER TABLE ONLY animals.especie DROP CONSTRAINT especie_idfamilia_fkey;
       animals               adminzoo    false    265    4905    263            H           2606    16684    habitat habitat_idclima_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY animals.habitat
    ADD CONSTRAINT habitat_idclima_fkey FOREIGN KEY (idclima) REFERENCES animals.clima(id);
 G   ALTER TABLE ONLY animals.habitat DROP CONSTRAINT habitat_idclima_fkey;
       animals               adminzoo    false    4913    275    271            I           2606    16679     habitat habitat_idubicacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY animals.habitat
    ADD CONSTRAINT habitat_idubicacion_fkey FOREIGN KEY (idubicacion) REFERENCES animals.ubicacion(id);
 K   ALTER TABLE ONLY animals.habitat DROP CONSTRAINT habitat_idubicacion_fkey;
       animals               adminzoo    false    273    4911    271            K           2606    16694 4   habitat_visitantes habitat_visitantes_idhabitat_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY animals.habitat_visitantes
    ADD CONSTRAINT habitat_visitantes_idhabitat_fkey FOREIGN KEY (idhabitat) REFERENCES animals.habitat(id);
 _   ALTER TABLE ONLY animals.habitat_visitantes DROP CONSTRAINT habitat_visitantes_idhabitat_fkey;
       animals               adminzoo    false    4909    271    284            L           2606    16699 7   habitat_visitantes habitat_visitantes_idvisitantes_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY animals.habitat_visitantes
    ADD CONSTRAINT habitat_visitantes_idvisitantes_fkey FOREIGN KEY (idvisitantes) REFERENCES animals.visitantes(id);
 b   ALTER TABLE ONLY animals.habitat_visitantes DROP CONSTRAINT habitat_visitantes_idvisitantes_fkey;
       animals               adminzoo    false    284    280    4917            J           2606    16689 *   visitantes visitantes_idtipovisitante_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY animals.visitantes
    ADD CONSTRAINT visitantes_idtipovisitante_fkey FOREIGN KEY (idtipovisitante) REFERENCES animals.tipo_visitantes(id);
 U   ALTER TABLE ONLY animals.visitantes DROP CONSTRAINT visitantes_idtipovisitante_fkey;
       animals               adminzoo    false    277    280    4915            8           2606    16490 !   animales animales_idcuidador_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.animales
    ADD CONSTRAINT animales_idcuidador_fkey FOREIGN KEY (idcuidador) REFERENCES public.cuidador(id);
 K   ALTER TABLE ONLY public.animales DROP CONSTRAINT animales_idcuidador_fkey;
       public               adminzoo    false    4877    225    222            9           2606    16500     animales animales_idespecie_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.animales
    ADD CONSTRAINT animales_idespecie_fkey FOREIGN KEY (idespecie) REFERENCES public.especie(id);
 J   ALTER TABLE ONLY public.animales DROP CONSTRAINT animales_idespecie_fkey;
       public               adminzoo    false    222    231    4881            :           2606    16495     animales animales_idhabitat_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.animales
    ADD CONSTRAINT animales_idhabitat_fkey FOREIGN KEY (idhabitat) REFERENCES public.habitat(id);
 J   ALTER TABLE ONLY public.animales DROP CONSTRAINT animales_idhabitat_fkey;
       public               adminzoo    false    239    4887    222            ;           2606    16505 %   cuidador cuidador_idespecialidad_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cuidador
    ADD CONSTRAINT cuidador_idespecialidad_fkey FOREIGN KEY (idespecialidad) REFERENCES public.especialidad(id);
 O   ALTER TABLE ONLY public.cuidador DROP CONSTRAINT cuidador_idespecialidad_fkey;
       public               adminzoo    false    225    4879    227            <           2606    16515 )   especie especie_idestadoconservacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.especie
    ADD CONSTRAINT especie_idestadoconservacion_fkey FOREIGN KEY (idestadoconservacion) REFERENCES public.estado_conservacion(id);
 S   ALTER TABLE ONLY public.especie DROP CONSTRAINT especie_idestadoconservacion_fkey;
       public               adminzoo    false    231    4885    235            =           2606    16510    especie especie_idfamilia_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.especie
    ADD CONSTRAINT especie_idfamilia_fkey FOREIGN KEY (idfamilia) REFERENCES public.familia(id);
 H   ALTER TABLE ONLY public.especie DROP CONSTRAINT especie_idfamilia_fkey;
       public               adminzoo    false    233    231    4883            >           2606    16525    habitat habitat_idclima_fkey    FK CONSTRAINT     {   ALTER TABLE ONLY public.habitat
    ADD CONSTRAINT habitat_idclima_fkey FOREIGN KEY (idclima) REFERENCES public.clima(id);
 F   ALTER TABLE ONLY public.habitat DROP CONSTRAINT habitat_idclima_fkey;
       public               adminzoo    false    243    239    4891            ?           2606    16520     habitat habitat_idubicacion_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.habitat
    ADD CONSTRAINT habitat_idubicacion_fkey FOREIGN KEY (idubicacion) REFERENCES public.ubicacion(id);
 J   ALTER TABLE ONLY public.habitat DROP CONSTRAINT habitat_idubicacion_fkey;
       public               adminzoo    false    239    241    4889            @           2606    16530 4   habitat_visitantes habitat_visitantes_idhabitat_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.habitat_visitantes
    ADD CONSTRAINT habitat_visitantes_idhabitat_fkey FOREIGN KEY (idhabitat) REFERENCES public.habitat(id);
 ^   ALTER TABLE ONLY public.habitat_visitantes DROP CONSTRAINT habitat_visitantes_idhabitat_fkey;
       public               adminzoo    false    239    249    4887            A           2606    16535 7   habitat_visitantes habitat_visitantes_idvisitantes_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.habitat_visitantes
    ADD CONSTRAINT habitat_visitantes_idvisitantes_fkey FOREIGN KEY (idvisitantes) REFERENCES public.visitantes(id);
 a   ALTER TABLE ONLY public.habitat_visitantes DROP CONSTRAINT habitat_visitantes_idvisitantes_fkey;
       public               adminzoo    false    245    249    4893               �  x�}V�r�F<c�"?�Լ9s���S�#��U�l�2���D4風ݲ�>�<H咓- ��C�a��K�p���I؄�C�B�L#d�S�p>Έ��QD��UL�]���)
 ���6�݉������=�f)_��Y�a?�J��rp���|�&�,fk�ZXx��0���)
Y��8>��%�3dt�����!�hq �}8J=̊]+��߫���ވ�\�4���mG�T��H��S��t�#�9L1a�m�Pƥh\��k�&C��i(c�������w�$n��RN0̾9t}�Q�a�֓��)�e,��ni��4�0�4Q�QsP�S9^$D*��d���.�%�ܕ@������o�@�Ĥ�lc�����0Τ��8�O��!��Z��kl]�KZr�d����4k�&��r��9��Zi�5�?��:Ӗ����)w�1qթ�NZb���n��]Q��5���dJ�u�N��7�<�Z�4�~~{�c�K$�4p5f,�q�e����V�u�M������&JQqx��©��J��i�<��>,C6P�h���-�2Vi�����q�O�QI7���ӎi�J��,�i�@	�L�r��<'�P�����a�(d/�j�\Oq{�梐���kQ]^t��H6L���\�/��e�n낔K�Qϴ��~�Q4���媂�U[�$��/&����q��c$�kñ�ō�`�2F��~�"Q��4��k��%2�Y�w°�s��f,�N��3��I'�ִ�O}����s��},*�%}2��I��f�i9�5��"h!��V��t��%��2S-���k�V�����a^4�iQ
�bV��9�kʊ��fŇ�vi�ٚ�E��>~_<��ےQ죅��JQj��%3>Y3�}%����˸e�_r./�Z�������­��q;�j��IB.�Jx�^�}��Z�U��"R�^jxð�;�@��e��_�AUkG�Xk�'o,���s�����Z^���>&q�����-i4*9Bt�ϧcޘO��k��g�ױjV���k�Jt�P�uږ��=s��0����V�Ĩ���V�`/�7����U��m����v�	Q䂛@H2��ힺ��aXFz��<�u�),_!�'e6�s���Ut�����n��§0!�y��R+�[,��B��ve���&�2��Z꣟. ���e��}���>�xz/��b����3c�_�.�         �   x�5�?�@���0���Hdpc���-)w~z�g�����t��,���,�XBO���x��&�d�+xj��G��D��oOХ!�KghU>*[��qθ=��L�<ҠkV����s	�����dUP�e�k��_�4%         �  x�U�Mn�0��3���C�.�Iaحag�k�� Y,(ˋ��K/��t��v�#�03�{O�|��X����)�R�R+�\��A)�H��a|�b1~��t���H��QIGh`fC�{�<~�/�T�T�L:�|�X7G�GIERW@U�d�������m_�VR�$CI�c;+^|n�g�*��E�X²y\+������N�+X�h�G8�7��<KRF']�5��O^�l��D���I��%CٻNl���I�g�0��FY!���uL�i���jZq(��h�/~?�z��{7�ٕ��}&�Px�]�Z�;�����S9�'�A����zh������ΐMn���i�m'����c���Qs>CӋ':�rw�EDE<��E]��B�m��n�6\�VS��{�쪂�`�m�o���8�`S��]�l��Yk�#�f���e�ߔNȐ�sߏg�lC��'*c��p�����f�,         �   x�U��N�@����'@li�9Fi�*��,Y%6�n���x#���e3�	���'�9a�{�%�ʵ#��$��+~�1Ík&�vg)��k��j�!�,ݸ���ᷮaMY]��f�W�[��hO?uα;⎄�~A^�+�V���	��&���/��!#���JR�=�+���y�����-fB-�jvc�A�za�2`��U�q�R���8����W ��qv         �  x�mT;n�@����	�/����HlǈA����Xr�%i���K)�tiy��!IR�3o��f�Tï�J���t��c/��\�� �^#۰+�h��םr<J)m{u3��;K!eޒ6��vjV��:g�/�qB�]�%y��A@7Jn�<���pm'4�ϭ�o�4�Ѥ�5��xT\�1֕��#�4\��ե%"�S �ԋm�������oIW�s������I�BW-�h�-F��i]8m&1�+[�D.�"��8���v<�dJ(�6{]5\��4���u�w�k-�g���N�	�*�_������0�3$���7�s����S�iy�zx�t.\VG�n�o���1����f ���/X���PO�'��M�(�,�N�ǈ�o,���{�Yc��w=9'tg]ח�mII[6�kåmi�D���79w5����6��l�<XHT���BW��2��qS����,v�/�2�\�� ��yB��UCPf�+�08��ºJ��@�'t.�y�k ����t̕����+�h�S�rMj�<��N7�ea��b��X��F���`� ���
�l�����jtJ�l!	i����RĈ�z'6;��j4�����8�:9��LD�#��8\l����q��u�c�U�Kʭ���NPc,hy�/���3!�='г�[���]
�.N��k�"��.Ax�N^�
iú��l��۳WD[~��h�I~{�y��{         *  x�m�MN1���)r ��?,K;�j�
l��-�2�(Ɍ�^�#p1���Y�s��~�%P�C����-���ݡbi�)�����Y

e\�M�{�<�׃,"��SvY��b�`<�*ؖ<��X9��a��9R#vI�����+�k��#��)���s�W�w>Pą'����C֢mhɨ�Z�{1�P��[l(�^��Q�L�՞�؅�׊����"��Z<��a�����-��d̒��b}��)A-�w��Jbs\��ӵy��*���]16Rj&�N�u5��?T�IH��.�qn��a䥛         `  x�-PKN$1];�� ��/��#$`#6��t���I��s�Yp
.���"��l?�����Tc��V��P�9�M�ѐsX�9O4��Vl��w{���%��.�Afnl��H�K<�Q\�8aȵj�w�)�+xL�36ލ�5_�3���G�gѼ�0u�T�`���Ze���ԬK��m�?����t����3���葂D��%�{
��<N�����3�:s�Jj�]o>��J�p�T|Ï��ncm�}3;���/��a6���-*GI��
68�C;b�L�.��?��D{N�`7f��������im$��Y�������+=<e�][Aô�3��	��%�X��^<�R\}=q�}4ٻ�           x�MRK��0]�N�K�~�LH`��ʦƭ��RG��\'�"�}�<94���U��)zL�C�wk-�i�)���} %4}�9o�;>V<g&O�9#�Ƴ��)x~ǔ1��֑�b��i�R]K�5��\���J�������'wK9��7R����4�.�
�r!J5���ӻ�|�R���y�{���@�e�dD�/)��T��\�R4�zR������J˚jY�P��z �^��9�ש���/��T���#�e�B-ן�Oo��g��2 ?�P���|����XEM�r�Wd�27e�3�|�uL��&�k��`h��������9 ���[���3��S^[t�)tB98t�^!o��-�C��h��$�y��A���@7P�*�w���ߦ�i�Z���2���=l�	�BE�ZR���yC�`���J�0B���j����>�=2��`���5Q�ǌ��{ o�ak��n�5=�<�[Lhs/c�.P�[�8�i��G
1�-$'�J!�_��p             x������ � �         f   x�-�1� �Ṝ�'0�z G���$J������������*��Z�a��YP�\��R�����4�3���nn8�.�h"��c	tS������1��         �   x�E�Kn� @��)8A��I�$���������=VG"L
�j��3�bŶ����Fţ~r�
���"��	�GP�~���a�l�X`�l���iہΉEX�7,1Cۄl�k���Ւ~vm�6;��� �L�@����+ƨ���;��q��$�������) ��z��&m����D^�Jm�]���J}�J=a���$��ѵ�;��A���]f�T�OC�}@_S�w��gI1��9>�����
 ��z            x�m}�v�J��}E�@�b��0IJ��EQ�������ɪ�J� 6��uH��k~`�]2z�;n���#3��N�O%��gĎ��Yr�U�MU��E{,k���&�W��M�q]�6��W39��M�&�ms�������,^-���;v��:L>�U�իerWv�+�cr��k'��X�d�j����k�]��=�x�[w|1M�l�z_un�'W���k��?�My�6����u�-{��_��y�Gw��~�z���c�a�Er���ñ�\�[��k��DWrԳ��j�'��۲kNߛm�<yۗ��^�f�%�B�巒��g0����t�����mUW����%Z$]w����e��]��N܆k����˭��-1�]YWG7�Rv��0��C�:M��uUuX&Lx�&���䮭˭�N�ztU�x+K>�ѣk80�	��'���~:Lnk���
t�}琪��0�@���>�⸦<�ɻ�yr��6-�,�(�=��x�ɦ5�o�Θ��؟��r$�E��h9з��c�0�M�p��K�{��8mP��з-[W�[,�Ahs�q����g�&ok�[�egXȺ]�,�<K�<r�����q�J�"Oޡ�v��}i����6�m9�"���zW�y�Ip<h[�%�ޞ{����-f�g��16�y���A�<�y��������gLj���q�/,ԥ;��q%��}�w��v�����*y�-�8��ǲ�~��G�i�7�S��}v��5���+�Ȓ������\�����^;������|Դ�N�����U�$���?�O-wy�!��C���~>��f	?9y�ۍ3tS���,�V���p_��#^�t�|g�`�^Z���qq������C���n�g��%���B���.�����'�c��l*^�!>"9ִ��2K�j�o�I���Tq4�����#g�̓�h�HoJ�ܻ����=Vx��kwĿ�u�H����<q�}��tV����湝������n1?
@V�Y;�X6[N-���=\�]��2H�ɛWRl�����Y����V�U�2c�������*M(�xc�I����F��D�t�NΈ-_�|������K{u�[���.����5V���q�Ζa�*=�z�r���j����Ky���~�[TBZ�6�f�7�(��A�9�w�-���ap]����+������sK�"�P��Մ��A�����V�e�L�-�q�q��\�4�����q1���Am��\�4K.;H��<3��S�_���]���=�A�\���j��� ����~�$��A��ش���v.�%�Dy)�l�`K��k]�z�y��2�J�@��(\��7����n��R�d;�m��W�2�R�0�t�����W;[%ʮ�Kb߹}/!�m�ty&O?���R�=��|t���F���k*�!��e��D�5�ܟS�| |���R�Y��p��O�Y��Ϣ4噘\��*��gl�<a{����wT�s<��ZI|qQ�Md�r:�2���ښ_ZbK�m����^�����UrSA��?��]E5�C)�m�v���:�7�9p�i|;K�<�H�V{��v�t��
�r�30�Oɛ���zU����,�E�� ;8,��p��NZ�'�-�z�����׃�-l?Pή�;���j�+ '����A�����d�Z�n�U�C]�Ԧ��56dT��9T����@E#�^�ɗ���`k��n���GC�3��H��C;�!x�h�e�'y. u�fQ�4�+�\uhp7���>N2u�%����q���u߅~xT�W���W��k���9N��z���l��`9�������gG�^:�ᠦ4�h���$d���(�{�{'``pHC͓�8����5F��s�H��-�.�N��k���"�$���U'*��+�,| �����-y�aP��m� �W���w�b����M���� WBBRXҗ;e��Qk: ���U,p��n`o+���$�n��rS/�8�8kP��Onǽ�.ӷ���k��7�X?x ��e Z�F\[8n>>
%ί�~�w8wOnz�m��tkg����ћ>�2n���5Ƚ�F�@9�Gq��~Ԑq_�~��@'2&��]��{��8a�
8�о�Ғ�K��-�I���]�Qβ }�"�5/��v�����=$�Y�4ְ۝�[@�aѨ�#�{"ԍ��s��������o�8@ݏ�7�/����w,kԀ|wa��2�� d��0���K@���'� ��T=W�{WK޺)�ق�Ϛh-�j�iM�W@��w ŎO�Q���v �9mُ�Uq��j�u�9�p����Ϛ�����8��j̠�=�x�]�ճ`f'��G ~�:�U>:��%/Ɖ�_C�@'�N X:���M;��:r� ��3��F�K�tm^��]U�WX�u����S�\��e��E���h���crG���k��,��7<�JqX1�f�� ���O�m)��i��� �������ٕ��0z�FmS�l5.����ܹ^�
�cEe�ӆYay��4�#���j�I�_qU�������^���#Y{�v0���%�L	6��뤯f+-Y���J�b�W7�YڀăO����o�jg��~+��E��� G+�#zڷZx`��ؗ���X���/�u� �[���bGwە��q��K�s�om��\(�X.�b�R�Joݽ��Uu��S�hN і�9 R���:p*W�)G�'����_��})�=ݕ�
HP[f.�}����v�FN?�!p���)���u���[mu�����Kie@����,=j�z)�#�|��3�i�-&�c9"&���X�.eE�2������{�j���D�OS��@��a��}0/��53�ݿs��)P�WN�wϟ{�%����c�-^5΂�*��#��.���:B<z�2�)����Er~�xW>���8#���w�@�,�
G�M�*�`<���R��cIGM>�[uZ�N�{�J���[�3�\����6��ٔG@�sc����W�R"=��ٚ������3@�����l��5<=<XW����ȓ�I ��e}�`�����4�"z�>���_�`G�/�֌Pؤ��I�3-0PZ Sj�Q[��|UX��Ԏ��j
�;q	���ZY��è^�b��a>g~Q�J�8*���ݝ��I��-~(鵘#{���O D��e�Z�E��6Xi��)���s@���@�B��;@���R�|c7|�'���k+�&!�{��y�񀾚&a�J)�9��yw P2�_�K齔�\,2� g 4����h+���Z4A@pU��s@�7{�l[�����y�xtrҵ���Ã ����,[j�to�羔�����2b~ߴ���0�1b^z�Dν���OF_� ��?0�s�#7#�L�O��vty��Yr�sOu�ݗTZM�ehF:�f{Y7=����ܔ�r�%����H~����H� q�v>��/��}�3s�dw(a��~��Xv��
�,'Ppa� ms �?`��b���` � A���;
#S��Zl��=����05w����c��zJ��Ԅ�^���o,v�t�����P��V;U�d��;�vx��빘G�>�n��zs�s��ך�BQ��ѯ�gjX��+L�Hz���hr���%pk@���]8;�ɣ8L�1�2\��	�����AP	��W�=h/�e�����|9X������(g�cOI��$qJ�>%C�5��rAQ�as�����}Zᄮ���������	h|�nZj&�X�{��>��#� ��ǂK��� �i>W�^-�n�kg�S���&���������se��J8[����'7�<;�Z����+��M���3T��ws�bo��x)�� ��ޕp�;��́�i��s�PHb���`�����U��X��P�
{N����g���A��52���֙w�|����%]�p>t.'^�{�"FE̡	���c�2��i��-詭���A�Ɓ{�)�D�/Xs��p[M�4��})��a ��    �i�c�{���m�90�9����"��(`ju��A�)���R~5�������N�������T��E'A7������6-��S��E����
Q�����2�������_�����N�W�����؇�P�
��
��ϧ��_>��f�i��Y��x�䣃H�G�]ӳ3w	�8��ˑ3��/�!qx���.�Q��@cG?_ﶝ?���q�d��:���pp��1Dh��*�_���_X �7_;�33a��P5�s biH��E��<�+�7��g[[a`��|�p�d�ʗ�8�>D�(��Ñ�{omf��4�<a�s.��Mn�Nn��>��>��C���P�a����4oO/��������O��F����QD62q�����|����EW]�ד�NMEr]>u��{���~o��ի������Lu�Yz��R\��H�^����@璘��Е����� �&t���KA a |A�+#
�3�m�Ng`tk��e�w�a�@��e�К!_�yx�D�7󸆸�"�6Խ}�H.��D���Gś�Z���Ʀ.'�iw>R�6��BS��-Z �Į�r�kW�ɸ �ŭ7�rCo)�.�����n�ٱ�d3 ]�XI.��>�X8;�������p��G��!(7c#�p1�����5�������uz�Hn*g�L��h�A�[�\~�&�W���ς	v�;d�a)N��|�3��%�W&  �>C7)(:~�e�Wy�V8���2R�a7�{i�S���w�G���kb��w�B��<83�l��@,\@�pW.��@�$�Rt�3Jz��� 8Z��l���;Y��!a�||�,��߁p�Wh�mO��o���isT�X>����X ���AP��H��4��U�E3CM=e�um��� =����gp�n��JX�!�@z	_,,퐏�F��D����o���i�^r�1n��� �^1fN9�y!Sϰ�(] ؆h�aD�k�zy�6L��=b ~��c�ۂA����R-#$ʏE�y�qO?idR)9Xś���8{, o)�*7�
&�j� #��@���0@�ג�P���U#m�9�o�}��7F�E���"�3�f�ra��� ~)t�t;�s�O����%�<� ��pxj�q
L�M�֕} ˵�3|�V���1������b��ɸ��U[D𻖏�{JG�%=�w��[�`�)�ޛ�^�{� F��������B����Igz  %~�Ȏ���r�;G~jm�#].b�L%7� ��O~vp����>��Y��[Z>��V�WtO�-�-b��{�Ôͅ�!�/=]Tq8-����R���؀������9}	�IL3�#���@vʖ�u+��4a�Ч����b�|/3�n�3㹔�\֌秬��iH���qz��'8���y�"+G���� �&�ځ�ǟg޴��4�e�'�����۔J^-��*��� ��nx%�Y����)��j>�3u���^��$la�V|K��l�Z��@D���r� eŏ�i�12H�/��(n;*҈i��
��iT3h���gW,
�Qh�Ytxjt��� �
��`�y+zc��XW%����3]{:�{�ʑlA�`تy��\�w�'ǁ����$G���蓛�=}W4�^����2W/e�犔B��M�N/���p
��Z;�=JY�q4��n�h�������UP�^EpI2�n1��o����	_���{�l�~i^b"�"S��˽��V>�"/�NN���*�	-���g�Y�FБ�md�z/XXc|�U�dy��(�Pe;�S���/����3��إ@�F�:��^LG�x���\�2<V��%�"�5B%��
9}?�S����C�Z�%"p�V�r	�{��;�� ������d�ܙ?��=A����5�au��ܳc�T@�a�j!�5���9ƹQfpe�J~��s��Ӹ΍C��!�+1^���kc�C`�/�M&��f'
�|�S�~0*)߁�����!P3��&����fw��T�gI�.w�Z@Ư)���,����2��^�b�c��4�� |�p|=�Ƽ>}g����8A��/[f��y��2',�T�c�cNG�_�$i��>}��By��"6XNYw��9���Qa�� �o�g��g�頻�g�\Э:ϒ; �'�9!��FQ	�%�2������%�d�%���zC�bA\ 䫲�v��a�y�3�r�ȠP(+H4�����M���xn��"`[��~
��x�_�8�ni�#%��{�<�=�Ib�;��%���k��~Lj��z.��H�3�� &h�_�������%0�(��|��b`��c��K�ň�l����/�o�����-�g�h:s:oI��e`M���QP����ezQ�jP��!H�v��nM`r�nz��u�����:�X~���Q!�����*@�E�EnG��9��g[EOm+vL��+͐2�D�H�,�#H~��:�K"�Oī��Erd4��r1k�����J6��Z 0���J����.�xS�H.?��h@b�T;�1��0��
&���g�8��
�篖"�����lq�����SY�K`��b�޶�s�@�f];�n�ma�xp�����wQ�Qň�Kn}���"��ݷ��;K�݆]�ȳT@�������	\4 ؛G��EG�ڝ~Az�����-3);P3�W-�����������ϕb�5PK�$V�"��L���e�ow���� +�텮DL��[!/�d�g�Ro�+��il��ր����؀��5���d�m~��Euz��eaY�1?����%0���yO�b�t��x���u�$�tE�b�ѻҨ�#gвH=����o�C�kq`���c�Ͳ@����r�j"���%=��s��{��,�3R��6'ݣ�g�D�������6#��������"���$]��+�C�m4��qvVg� �i���wH��)g�Bߥ{n;Yw+���a��ah�y]�;�����vA!�� !+���} ?3�I�0��/��5��'8�Hj�ԇȄwZ�2��Ѳ�| �6�
�w�"��w�GJ��B�W��na:��G�%*�ef���@e�5��j手1H�qu�>�..d=�W՞�8�E��"��
wL�#Qܧӱun�"�D�8O؈�8�+��;o�˿�ё,�VrŹ3f?J�L�[>a�n��V+5���J%m�ռ�p�I�/��UV@�X�j�s�lʵ�5�b��0�ԇ��B�Ci�qIa"5&����5�E���d�g��7�^�����Q,f������0߅ō&K���$�V�����nN����b9x����Z
��J��P�xwѮQ�l�O�ǘ���*w�ݶ�sf�5ܸ���o�U��\\sK��R�Ĳ�� �v�[�>95�������V��	"��Q��u�:h�Go;\!+�M>H���R�X�Gֽ�8�e�}�!��{:J<�G-�'bŀ{�����w�ڊݱ�l`K���w����fu�ʡ	�7Ơ�I�gw��{pr)�V3o���W[����l�(���tx��ڙ��/-�,��!Y ��0�m�@q���1p�Z�(	�þ���3��,8����E�B2"8�����g�d��+��cE���C7��q�
8b���HU?�����`�'7:;O�>�,��!2�)8�88�h��k�p�Y3J�V�K�ȥ_�]We,-�m()oF�zr~��J��2���fr��Zv�%A���IoZ���#���sk�B1�6O3�T<� ��M��r��K��VYșt�"�e���ĺ���%_�e�6�q�Ʋ�$MVܒA����hm����g+o���ŕu��,l��d�s背9�Y9���픿�[q�HI�īv�!g�I���+����=���{���%H�2g��S�a- �O���r��#�èߕ	ȝl1����<C���eh�Sѱ!���t�s����]�=�Bt��1�_{B    K�ǁE��bl{����,�c�|w�H�G׀�8�������t�S�<�9r^���[��I����%��r}�a�	����g)Z+��Ջ�������*�XJ>��~���<�4F�
�8뇔�Nl��qL1k��B�X�g��[VH���L���8N���1�	�d���!���rk0=3J��idL�&��1i$��ņ�	6F�t�!f�鋀�Qཁ��\��O5玲�r���.n�#c{����z#z6L4ِ�[�PIj�Ng��;�Ҹ�*+=p��w�N�ъ1��Qe�c�D���LIs����Hɻ���c �Au�!�]e�X�tr[R;��E�k�ȓ�M��fq�w���>Yxk͟I5��@�L�(̽#N��/� �2�_��b�&N�l+�N>���F'F	��9:�b��'��_B8|"��$��ߪG��Ak������@���� _��{�i(蝌Wr�Z~��=R2�]-�2�I���"	i32ӫPW!�{��$�Ey�4U�)�
H�Ɲ��H}΀��ptt��!�%�6Rf�)�:
�Yf�b��`�\�SX��B���,w����
`O��Q��Ҳ򉚽<1,���V���/���%}��>޷�<����;Z!s����/Z�Y��΃���/M�W��Q��@{a�n[��e*��\n\b�rL+,���4�<L�X�o2�9���`��{��}�7�My�tR�Z*)�q�/�G��@Z��Ee�`�;+����2��Q���|�J K}��2p�S����V�Pވ�r�:X&�֮	>&�!삮V��"/�"�6���|�R���d�h1��R3�C��^NCi6�v�qvD����3�_����F��y��(3㢑�Ib^-����bew���%���.�82ŞɪHӁ��l�F�Y�:�aX�[U-I�4d���˜Ɠ"�(se�i�S����D�)^�!յO����fg�Kk,�͂���\&.�X�G����f�j
����[�-��l��� �D3�g^�F�=�i�f4�]+v�9"���S��5$gXИ�� �wm�^r�y��1]��z�/[��'�H�fX-����#��;Q�����\f)��N�F�NA)���'1Meę��%gI�3Jy���)Y���_���r4e�{]��.\(���mfG�+�۱0�eϐ�]�}�s3�Y���e(��2�ܱP���d`���!����3�N�p��Q1I���:� ���oOߏL���� ��#�Θ��/���vK�D�we�ëxհ�P'kq���'ҐyʚqY��2S�0
��y��)�Q˽\s(��h��\��m������������O��M��C�s[%�@���qN/S�ݴ��*a!��)N���-0	�5��2�U��������|kIށ�G�Ȁ�}��ō.�{�D� �ɫ$D�];Lo���GB�m��N+?Z$7�3I�s#�
^���.%�c�C�*s�Bdn���/Qv��lW���
6���N��v�$~EČ�͌��D ໩��pʳH�(�l�Ѥ_2:c~�� �h�Qh4h3A�i�������ڞSS4
��õ 5#����
�\��](�#w�� ���ĄhJ�ϓ�>�|�����?�vă�t���'���&U3E�0i b_�lLF��i��,Ʋϳ��+B��Vt�ln�'+օ̣�4���P��7L7䖅6k����UOfr=8,��K
�m�V+��X�C�sM�6[,"��^�2��SZFH�9ʅ�T9�eVW�yo>[���jTY�����Ƶ4T#ğO ���J���F����)�(B�F�<�}bV���>	�C�`�^�v����)�����$R�X�i\"D��m��._� BE���0��^��?W�([�t����휅4`���Yj�e�ąL�	/
/f��&W��x���cl_�oM��vd@q,@̡���f!W���d��B��/�ȥ$b�葵�ǎ����$�L�yV��`>�)��&f#f��f�(�7_��VΒ�ec.`4l�v>ꝭdlm�	����ދ��&��:n���E��,=10�>yK����Q��Jza�H�p/�
�b1����G�E��p9�kV�C�e}5�n���MC0�U�VC�+o�����R!i��8����A|R&�o���;��
n��ٲ��4�kt��5<A�"]��1��U��b��"�/�=�~�aUm%Y|�F�"�N'T�T�5�$��� ��dh�%s� П��F�=�PxpҲj�U�����(�P�7��H��0�Fal_=�K8u��2	4�dut���u��cd1���Y�����¤Y�p6������Y>�@�<��W�+��a��[b1[6-5R�&�U��S�P2�G�39�� c��gy��2�h� E�vu��%���Vu�8.J"�[��W���S0a�;��W���_��k*+�!���W|� p(��}�DK�
U]��2�23�*���xqH9�_KG�10no���V�]��y�)y��#z��Q�K|u�y:�fΦ�'�(��|F@Ll`YWue�;j�<J)���)�!�B�|�4�ujI�4.l��p�!P}!�0ڊ��+c��u�2O�����MXDG����S�s2�c������z��|�Z҄r`�(�<��K��>99�/9AR�j����~96�BZ�z����k��%�rr0,�_�V1������9�+7U�3�uKj�J&(N��҈.��F�Y��,f�+�]5]������g#xa�X���eu%��EG�V�^Oc�XI��]ZY��G�,1��!8/;���/�t�P��W�a��!��~��C2D����Kd����9��<}�Y�*D�sՏp�(�	�^p[�J� Mxĺy1�j�S>ƍ���	��'��*gA$�e�i��bn�Z�)K�`��:z�v!�'�F"
ƴXF�/��.W�Z�*c�uX��7`���V�B7���e`�y�5U�V�V�p��~���i�>S~2?�k�dh�4��� A�,~>Y�Y��q�ʗ�`�:����ӫh]Z�*O�^H_ L�Yc"vli�d���!���y�9��&R1S�3u����FIM}��iv��A��\��,P����U�s�˦���V&:{X�tT�%�Z������}��D; ��Z�S�8K�w�W�P�,��FT���7���UH>��y4$=�)�q<p�ZʣO���<=�l�q�.��6�ڗ�J_K�cm|5��y/�ްE��G���`�|�X;B_o�sTw��' #Z'=�FvH0c�t���!?�Ũ��{b���Q5����&,6[%��q���ԐP�7���k�'���F���r3c�6�U��4���8��k��jC|k����r��L���W5���ق��R9|V3�C��P7B�8�|'�9f'��FN˜��|�Ԫ�b#2fx���!�<�.-��=��C�|��~�φ%�0��g����<�h=�������z{t8;�	�n�������<WXa�Mh�8�Y�OG�p|`-��m�d��J�L#����o�Qϒ�ↄ9�UĚeVst����I�Ԛ�5�/�9XӨ�F }�_F�狹W�����l �� ���/��~ �Eh�8��U���ܣ,�`8T���|���9Y����b��H����B()��bT���UL<g�T��JY\��Ȅ�,b!���C�faq�ʧ�r��u]fMM-���[1���*�l"��ş+(�C�����Y)Z_�Ck��rnr���̮x\G�����&����|����B1��x}-�+Ɍ+�,Nl9�>�ᷖ�To#�A���-��kn©�5ض
)��j�t���@���g�~C�;Ȣ�[i�*x=�U,�PQ��^�y��p}ΪQ��ɥcQJ����gs_xlT��o�@BpC}:����#{1.�O���1g��|�o��; ��yB]IL`�{�,�0�c��l��������|-�(S�q�*�f�`�W#�y��5�����؍�m9�H���O\.�g9<���_���H�l�=�X�n,�S   n�J��1�K5��D���<z%�"�����(1�UJj��	{��,����"�j�k�+@�	.	�TXQ�6���R�,+�f�@�w��kG�S(x]�lQ(��/����ndBKB@��g`̰���+˳"[��a1M�Kh��D=�(r.�|t��/��?ԙld�?#x������g'�'3�gF�뻣%c��� RG+sH��)���G�V��:Ʋ�j^�1y�A�+�`E�C���P����Xy�Xe��{1��|�D���\K��^N�Y(?��_S�y~���T
�������X��1�C������!��&��`�rD��6�W1�B��"q�#'h��ħ�jo��Zv	�:���O�ezk��7�`�9|XW�P�j���סJi1�#;�Ie��3�+t&����Zp`�R>U��K���H?hݘ-nE$�m,�߁��8��|q�*� �ԌknT�Ɗ��Zv1�6Ļ�p�u�Ja�=��<l�oF5�T���Cz���W��4�=_���0���V��@�=��w��PU����=g����K��sU�e����t?��w�X7�V�G0��"�nl{������.kdNo{哱Sr5/#I�=V�MՃ<x*f#:e*��g�R�bրi���;�͡�'���m�bY�e��?����Q��	�hN�j������� ]#T
:߯;9�?2�O�5�4�`�W��o}aZ�S���,�˿�dDu�̱�m��"�;	1>_Abv��+x��������ի��pq      �   �  x�}V�r�F=��"?�T��>��ةx�+R�+S��$��M��̔��z!�KN:<x ^S�s��1��7\5�eV὏�P0��1�<]N���6��h��ix"\�u#E$3�چ�;�6�7�b�YX��CW�,�K�<k��0�RI5\TVC<�ݑ0���fVcx/�e#t�B��z���a���Dq������s"�a@�� �}���ìص�0��.]�9L�k���vTO�(�d�t�8��p$>�)&,����ʸ�KSb-��q,]#e���\6���$qܗr�a�U��G��M�ZOr���a(c��tss�ė)���
����8���*!R�@�%�u�u�n(1�
&5���W$x�J$&5�e�Oe��F��8�^�?����j�nQ�u�.-hΉ��B��Ҭ͒��kO�46jQ���P,�2\��L[:�r�<L��U�>HK8i�q��$��OD%S
nCw
E�y�9�2�����f��EΑX��͔�|d<ǉ�)O�[9�!6ijT_/Ǹ4Q����{�N��U:�\N3��1a>��JEs��o��J3��|��}ҍJ�144ܘvLKT��g�L�J�e�3\��*��_B5�2�?
�봚i�Ǹ=t碐���kQ]^t��H6L���\�/��e�n는K�Qϴ��a�Q4���媂�3��0I�D_L��=�;�bi�HT�.�C�m��e
�D�	�TE���i��1�F�Kd���qf�3�X�?����&��[ҶW|<���A�n���UįJ�d������Z�r�k��Y�B�9����e��������L���.�[�q���<kӢ,Ŭ��K6ה��!̊Uvi�ٚ�U��!~�=��ےQ죅��KQj��93>Yg��J*I�qˬ��\^��v˫+�;D���[����-�&=�l+��\�z�-=3�f�R�E&�>����qqw.�d�Z�V��֎*"б��O �X؄+�s�e���Z^���>&q�����-i4*9Bt֗�!o�'y�%R��u����r���8�w���kbϜ�u�S5p��%1�(�m�"�%�&s?�j��r�����?a&�\pI����>���H�T��ǹ���;��+��̆y�ݴ��Ԓ^���-�W�&D3��Sj�y���W��]Y~y�	��k�����G/*��ό�Y�<      �   �   x�5�?�@���0���Hdpc���-)w~z�g�����t��,���,�XBO���x��&�d�+xj��G��D��oOХ!�KghU>*[��qθ=��L�<ҠkV����s	�����dUP�e�k��_�4%      �   �  x�=�;��0���)x��2�>�N{�4��% �%��m\��j���e(�Ұ!8��O��D�<�{��h�J
5�0p��I��ǟ�7Jg
0"�-���9~t�K�t�4B&r�ړ<�+��(m֐����<�[߼-3k�F�(aOS ��C���L�R!B)*8��ɶ���R�D��IA�ѾRZ�+ej��N����[���	c#�9:���o�
8o�2V��~l-ð�1��kd͚6�(�����m�'��y|RX)��<P�l�⽿,��Q���vtu6�����/�G<�߉������A�LXdc��=��=$:�bG�k��t����sQ%�ȥ<�74^~��=��O�8��-q);�1��Re��c�x��R�t����!�?��y      �   �   x�U��N�@����'@li�9Fi�*��,Y%6�n���x#���e3�	���'�9a�{�%�ʵ#��$��+~�1Ík&�vg)��k��j�!�,ݸ���ᷮaMY]��f�W�[��hO?uα;⎄�~A^�+�V���	��&���/��!#���JR�=�+���y�����-fB-�jvc�A�za�2`��U�q�R���8����W ��qv      �   �  x�mT;n�@����	�/����HlǈA����Xr�%i���K)�tiy��!IR�3o��f�Tï�J���t��c/��\�� �^#۰+�h��םr<J)m{u3��;K!eޒ6��vjV��:g�/�qB�]�%y��A@7Jn�<���pm'4�ϭ�o�4�Ѥ�5��xT\�1֕��#�4\��ե%"�S �ԋm�������oIW�s������I�BW-�h�-F��i]8m&1�+[�D.�"��8���v<�dJ(�6{]5\��4���u�w�k-�g���N�	�*�_������0�3$���7�s����S�iy�zx�t.\VG�n�o���1����f ���/X���PO�'��M�(�,�N�ǈ�o,���{�Yc��w=9'tg]ח�mII[6�kåmi�D���79w5����6��l�<XHT���BW��2��qS����,v�/�2�\�� ��yB��UCPf�+�08��ºJ��@�'t.�y�k ����t̕����+�h�S�rMj�<��N7�ea��b��X��F���`� ���
�l�����jtJ�l!	i����RĈ�z'6;��j4�����8�:9��LD�#��8\l����q��u�c�U�Kʭ���NPc,hy�/���3!�='г�[���]
�.N��k�"��.Ax�N^�
iú��l��۳WD[~��h�I~{�y��{      �   *  x�m�MN1���)r ��?,K;�j�
l��-�2�(Ɍ�^�#p1���Y�s��~�%P�C����-���ݡbi�)�����Y

e\�M�{�<�׃,"��SvY��b�`<�*ؖ<��X9��a��9R#vI�����+�k��#��)���s�W�w>Pą'����C֢mhɨ�Z�{1�P��[l(�^��Q�L�՞�؅�׊����"��Z<��a�����-��d̒��b}��)A-�w��Jbs\��ӵy��*���]16Rj&�N�u5��?T�IH��.�qn��a䥛      �   `  x�-PKN$1];�� ��/��#$`#6��t���I��s�Yp
.���"��l?�����Tc��V��P�9�M�ѐsX�9O4��Vl��w{���%��.�Afnl��H�K<�Q\�8aȵj�w�)�+xL�36ލ�5_�3���G�gѼ�0u�T�`���Ze���ԬK��m�?����t����3���葂D��%�{
��<N�����3�:s�Jj�]o>��J�p�T|Ï��ncm�}3;���/��a6���-*GI��
68�C;b�L�.��?��D{N�`7f��������im$��Y�������+=<e�][Aô�3��	��%�X��^<�R\}=q�}4ٻ�      �   �  x�M�An�0E��S��IY��m� H����У� E�$e�:=@E����S��n��������$�X%�5��;d�(Kw��Y�q�v8���2ɑ�uzOƪ-}��%פ9KL%�%�z����廓�D�@�%���D�^��c*��U�9�Xs�M�ԞEF�R��c���V��[�EJ��Si�F�=q�g��J�	#R)��c���#�t��<��+w�Xz^��1U��+�W��Pb˥x�9J�Jh[z�'`���n���|3����ڴ�eX�7��,�R�G��wtc�s�A�o|o߿�W�|��>M`�mp��"y�S���2x��г��kj����i�l�KD3u���>4vk�C�KJ��5m�/���
8���J�?�3�9      �   -  x�E��q�6���b2<���_G�[�wƞ1͛8�?����������k����m�����O>#���Q����պ������gͷ�G?��]��W�jK��j����՞�L[Cɉck��~N{�F;�w�G�s�:H���w���C[�W��;�6��~�6�j�o��Â�YWWMOnO�s��3��w�흺���\j�ޓ{w=sj�Эޙ�gi�����΋hzo�j\��w�Go�x���wYԳ�K׻���w�wW��]�Ph��%�͟}��4G�߾�Х�@��ݓ�y�ma��m�滃���Iii�6b_Ľ�E)�D{,��F�R�zcx����JQ��h��t��~�(�K��,�RV����}t�{�l޶�7;�҅�"�����B=޽����>l����Ѵ�ud��&/R���=�>��}�-s��z��ْƱ�����xV�ߴ2uף�������|o�khtt�����P]@#�����N�7x���MKW׼�k5�oȉ��I�zk<�EˢS��$,��b'����fr��jY�,�\S+zI_���19	�w�gi�����Î��T;��^L��2��tx����������8�(es��]��[��u��a�5�S����my�����;t踞�4�G�ʅ镁�Y���ō�_n���˓Y4$K|��a���&��q(��BCᗱIȥ�p�˧q���S���֮���<��!|[��X^_q�nV&�K;:s��ɚ�.��;�.�m���!��ћ� B�����~����+A��N��?w׼����Z�6�:��QWb�.i����a��r�S����J�8��r|���\��йm�B��������{�ٌqL�Ö�h����q0��; �H� x���V��PG�9a���UGg�r#6P���f����\HjZ�w=��9�E9�Zz$wm�8� /���֡�����'L@�����Pt��i�I1�C�^#p�� ��R:���Q������u��� (��#��a��4�OV��9v�d�g�:g�
V�0Jb�^�b�k���<�K�CU8��I�BD�'8��,p8g牋�\�$�QղN�vP�ꘆ���lXgL�ٕ�&$\a���IP��H���Xc�}-�E�ՋJ�l�B��Ew�Y `2�n���
�����A�o�~����ז�'�����k��%��f�Wnxчh�r%sY���e��.����k�K�w�29mV>�I���܊�^Qx�����!��I�DjG���x}F�Ag�NH���(�.3��
����hŊ�m
��wu�^�\�����(�|э��7
p$LzQ�|#e��:���ƞDy�_��+��3;�a"���6=(#�Τwm��cD,(��� 0?�4+�5����r����6�!�e�b$���.3�p��� 5�)}�߄ߡ�$s�ȭ����6,��b��i���C'�e�8��	�0ǝ�É�H�]�,�^<���8��)����S-D�
d@3�wА���q�9+l��&t�ӢY�3`��*M+8��3/Mc���D������"�X��c�b}'in1|�
��\�ǲ��MD�Y<?�;u%:��R0 mV�)B=��[���
�,�cLss�bb������D�����g�D�1ftj��QRў��3�ظ_��b��H!2�"�7ll(�8 ���P�W	�� `��i���*Zό���̬��V�sG�-��� �锏�#�3~�gn���c[�l �ʱ��la�qBxЊh���f�g�[���I���)Ľ)�=�h�D����a��R8`�0�U#}���G��܎��R�1��AN�-� 9�2�f��`�f~I�j����[��nj+�.cv��Nx��g��J�3}РE��V�g@�W/��ɦ�r�}ר����%���D��9�BZ�s�b��I�ᓔ�	 ǌ��Q�g)GeM�Z��DJ�� ;܂�[��@>-�Ύ�y�e���Y�t��$d�:Ff�V���Z&�ꚅ`�]e/̅@ת��ʊ�4�7(m9���`�3�s栯�	.��Qu���J��"��9�E�r(�n��Q,M���W�ScT�c��A���<8�Ѐڅl/�Բ�k#:�������V�b��T �����-� v�3�f�Z��QTH����ޕk\�l�W1�Y+�-� �X_2@��+x���;�U��!�b�瘋�����,SN*�#��[0���V�Xº�i����k�ͯ)�b�x�H�" ��w�F��n����\}�̪tc�iS�.���h��!��P��nN�(#���n�I��M��������f�"�j��(lmg$t۶�,FO�W��(@l.��V�ԧ@<�${�v������u4$�=�և���Tm@��%;{9}~7(���R�gU�h9�*�����ک(ʰ�S��=3��UdpP{���w�b���� 
ZE�8p�D��E9�Ώ�n� �?{W�A}��M�)r�]Q+�N�yX���o�������,Gd��vUnRw@7�i;zE0-	��箂 �xG僘JT�	Q�a�?݄'p�Q�FY2��Z��J�;�9�⃺F��в_�Oe�;�w@v��`-�F�k�f��U���#���Q�3���R�b^QN�wlc4�֢�*l�]��Ky>�q<@��oA���63l���fUP0� �L���ubK����.�h�Fb���Y�	�$�U�s�~��NƷI�P+ʯ�����CF�v��* 7$�������^��UUHaJ�i�v�_	X[W�$�7�B`<UGƕ\�a��b��M�IZҢ�!D ����'8!�Z��6�0���ÄC�U�g��I����pV�IH�X�|W��YЙL��Y2�Up��0���r|����7�UvN��UFә�� ˊ_�.V~��X6 +V��������]�=tb:y;Y��vI�؅��^�hE�pE���K�cۢe|_�V>\pC��'�x���%�z�P&�����?��3h�-�}�Sdj$��2�P5�hv-�I���+:&�Ϡ�LSTf֗ �Td�!S�*�MKC;�ԡ��A ŝ�3����V1h�v
�Y���>Ǟr+������m�V��F���_D*��tV��w� ~��ؙ鲀�![���T8Sg},���5�Jc�`���?��Yg0|�mtJw�I�E���W.}Ed,�]��&ݟ�ؤ @GT.����6��U��bR3Yp ��o�\z��Z�c�����s�)r{�T�.��5��sV���Oj��QGM)%'��gѿ�Ǩ��3�\p�Y�Y>���̛�����3��\@��d.�?�0��'�P�W\�l�� �]*G�:뫡�U��r���䶅q��}�L��ݥ��@/�.q��O�I_9��:����g4��" TU�+pǠ��Ψx�s�"��I��"��+�Ek=�г����M �,X��r�{s�Ú]<<�e4�-�����1k��Ȫ�C���%�pI������>��)�D.�5z������_1��l����s��:ذ
��<�)�� Ny���j������}&T�\e����}�����      �   �   x�E�Kn� @��)8A��I�$���������=VG"L
�j��3�bŶ����Fţ~r�
���"��	�GP�~���a�l�X`�l���iہΉEX�7,1Cۄl�k���Ւ~vm�6;��� �L�@����+ƨ���;��q��$�������) ��z��&m����D^�Jm�]���J}�J=a���$��ѵ�;��A���]f�T�OC�}@_S�w��gI1��9>�����
 ��z      �      x�M�[��8҆��Wp7W�a0�p�:���\�����Ƞ�5��Z�~��fJ��蘙!���'�N�ۨ/�����N�ze�4=�egYgѽ���ˮ�ɵ�JSKZ����tϣW�odr��x����3<�.�<z�R�]r!t�QX̲�YI����~+#���l-Vf�dE\D�q��"Ym�8(�rvF�x�Zc��C�3;ᚎ��g3�)�2���<�z'�Il��,����a����f#�6fAۦ��^��PF&��Ro�p�)�4���!YKqn/�[f�8͢����ɽ�l�i�=9[��<���}���PR7�H9���w�`to�l����"Z5��I�K�5�x-��"�ji�kC9�3�ל��2zR�`�\j-�ޗ)�2-�㼈���^?cO�U��Ni�)����U�Ǚ�+q�l=���Dr�cw����i��ъ_�憮=�@x2�΅���9HѰ�l�Y�ͧէ��	9y��Q ��Ȱ�8x�2�(z��.��W�̊�BKk`7}�n:&L�-����{���]��9z�KgT-�W��J�FQ��U�c���� g�.�2'��g�,P&w_�H���泳���i���>կ�z�Z�;΃x���(K�SϑU9��[񹵶	O���<zp��'`�N��)j�x��֝0�5�9�k��O�||gA��<*�q��x����A���F%7�3�@�ٌ�2�v�������V4�B��q�*z�_	~V���?�,�X>��!�Pv���n����y�����A�>���p���<n�'뜒�t���YcX���%Q�9�8'���Ʃt��$,��8�Pj�0&y��;LR���^8M���A�Υ|ݵb=ھ��yN�_q^F7J7P7I�_I1�g��u�kh�t�kd��E+�D��vtϜ<�H�s�ʐ�+�)qW�y
�"^@��Vm+�n�R�x�N�$
/$9;K9b^tN}�ǍS�v��߸�hq*�F�}��-�E!v�<�"2�T(^,J#z����e��$�\����H9_O�4U��L�8�M�ڍu���,��@BT'7b�N�2T�ыD^\�r�
��`	j �;/���,.�8�u[�>�^6G��T4h�<z�f5�ȓ�Uq��.�Jɳ���>�I���������.��2.�ѕF��Pu]��S��9��(qu�D�\���F�R �EE�����x����x9�.�k�lr��jY�2�}D�2���������IN
:�2��{�⓬�������b�^�DJ�r��������l E����s����"z�`BP��z-JYĳxYP9�84�6,W$�KT2�A�ȶS^̹&#Ȗeto��{D9���\Q$@���Q���� �׳��d�p�O��=B�f�+S�!r�-^��T���ҧ���aw��+P��-�r��c�~�7�?lλK��d3����,�p.я��' {��걘� �$.f�P������Y�T��nH.�Q�X*a�V���q��t�0e���d��F=�$��+*ep�Iޭ���9�*Eu E" �lP���ʢ7{����!��S�e�#՜R�|���>F���Vh���׫T�ZD�����}T{��+�Z����^�H)�k�2�֠D�(L�|�"Ļ��.h�g=��8�ŜX���Ky@���Q*g3h�nze�K�z"�[5Y)���r
6G �Ԏڃo:V�t����h۔���`7�Gk��5��3��Z�|�l�y�\l�`QT0'�r?ڰ�\Hg=�l�%/}Ө�lr���%������S� �����A�S�9N3Z��X�N~�J�4���R ��uLhO��Iq�iJr��^5ͩ�`�K���N~�(xCud*N��PH�d�=�BJ짂E�R�k��CoD�Ò����x/41��D�t��� -���� ������k7A�sf[�B���c	���Q���ݓ6��%	~�q����Ԛ��	�B'���ζ(�d���IT��Ȱ�܈��/A:�K1w� ��N9�<���� �ap�3<#�Kgw\JJU�����J����*�N1�Vk�	1�M�h�z��E��Z��l�F�k8�)�6���?����M"D�ۆP�|�D"��]7�F k�]���'���)(� ��Pʸ@��P����ˢ��j��1��,){�tP��>
g���c�e�h�x��nwz�w�ۀ�+��5�NXױ6����MM�ߥCeRcY��K4Z��Nh��8��B=��  ���>u�0���!y�M�����RV-D����*N�5��{��Z�	I9�^Mp�E���d��# ���:�OdΨ�����������.�z3��~�y�X���+T-�����ľ�"�� !�X �&�9	yrD�I���c��h� �D	���a
�Z��`������;ZEߍ��y��=C6����Rڄ����Z���}�DB&����؅z���x���Hم�%�ۂ��d��^Ny;�/������g�Q����� � ���n�s�Wٲ"��é�HA���@�&�����n(g�DX{��T��gߴ�/
�y{!5�2�hۃ�&P�ƜZ
4�-��V�j���Q��Gרf�g���L6)��DWC�߄2a�d�!��=��}����@�h��_��޹�)q�F2Nt�Β��(��S֓�
*��?�MH�t|�Nwc�M@߅�Y �
*����A=3S��tl����̶M�e��On����.����<Gi��]ȱZ|�5<�GC��op��.ؤ`� ��r#����;��
���~o�sw�;_���^�ПԖ�kЅ�t�����[��E��xl�tb�3%	�Rpk $Ñ�����w�o U9L}�8�GC�~8�b��_��B���3x�}-�u�/�c>>��rP:վP��+�d��oEC3����]
���]F謉��GK��7�M$ݤ$���&o�(����݇Ŋ�@"s)8�Cх6�WFl���Bw��<@�\��Kc����:���@u�n����������`�a��DP����ں�1T�aoP����ni��!�9�"��	5���OHOA�h�������,�fqF6���WrL2,��f��J:���yl����@�Ļl���������)�ۭ4��e��2��5����~�F�^�x�8 R��}�MM?�%A�`����4ѝ�d��;l��(���=��h@	T_�4�}��l<�����4�I��[�u�5E7D$��m��b����Gyz�n�r�Q�qO�F� v�4�mB�uNa^�)����xz�w��1W\�� %1Bl�����Նv�GiH��~#�+��zo�����5��rh� �?���;�z��%����;B�)�ɥ��kt/<��!?g!3��߂K����kD�FP���9?��� �:}#�4V�sk��+n!Ԃ�tq��e�*7:	��ZRp���(�(#4U�ڞ�� ���z�\㔆��!j�hX�&�S�QOć#Y^w����i������]�j�nƢj�Z��S�&ۀ�o����8����\���5͑���:z�P�.��K#M���vDʀ����5}kaȀ�4����0���G&����QHМ_����N���
�~%��Kь�J6����4��i�	��2�[z��J^�r�O��fs�oD��ԝ�Mv�������pA�g\}2�;�h��|�H���ɠ��+��� W�:�r�M�AJ2y��������y�=�$�k�����`�B`�:�N짰��Lt�_���"��}��9�N#Ke��K�����4����`dG���g �"�y�S|m��DOˀ�YN*�k��y$�n_Cz��D���K��<��jp[x�F�GU�3{����ow�F���� �gw.��nd_�nG�~�l$*"��HA�Z���Ə1=����F��ˣ����%}钇���yb�7F��UH�,���Qt�co�������w��e�x8
5�<�ijk^i�S�.�G�� ^  �L�H�y<u뾺���g��"�O�l��x�b��q���f��>%��y�C3�h���ߜ�L~�u-ݶo�X��+hJ���'{A��(�.�q��0�3�K��qK(5�d>8d@�s����]XZ�'�Ӈ�D���e �@�o�d�ʺ�c��b��9{i�t��	��8X�^y�PgI�y8��8~%ρů^@H)�����h�ZH��*YS��o.TV������(���/0�����c��9��!X�B'M��2��J�ѧ�q�γ:>������:��9g{I�)�[�� ��G�2E�4g���F�~�0�� �k��Zꉠ#JJC�h��*�W(�� �Y|~�WZ�����Y駠�Cn����7@�.��/Vu�8���"��� �V]'j��T'����%P��K��[r�	C� +���Sr�� u�N��H.� >�?Y�'��]�B]�Ut�Р�4]�/�q�>å��h�n��>��r�����a�j�yO�#ZC��xĊ	d�O٨�Oo]P����?��?nQ���Q�?���=O4�4Ȕ<V�P܄>��t���l̪9��J����#����8���+w     