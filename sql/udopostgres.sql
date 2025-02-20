PGDMP  +    ;                |            udo_postgres    16.2    16.2     �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    16395    udo_postgres    DATABASE        CREATE DATABASE udo_postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'Spanish_Spain.1252';
    DROP DATABASE udo_postgres;
                postgres    false            �            1259    16412    board_users    TABLE     �   CREATE TABLE public.board_users (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    isadmin boolean DEFAULT false,
    boardid uuid,
    userid uuid
);
    DROP TABLE public.board_users;
       public         heap    postgres    false            �            1259    16396    boards    TABLE     y   CREATE TABLE public.boards (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying(256) NOT NULL
);
    DROP TABLE public.boards;
       public         heap    postgres    false            �            1259    16470    cards    TABLE     �   CREATE TABLE public.cards (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    title character varying(256) NOT NULL,
    description character varying(256) NOT NULL,
    date_exp date NOT NULL,
    list_id uuid
);
    DROP TABLE public.cards;
       public         heap    postgres    false            �            1259    16488    cards_users    TABLE     �   CREATE TABLE public.cards_users (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    isowner boolean DEFAULT false,
    cardid uuid,
    userid uuid
);
    DROP TABLE public.cards_users;
       public         heap    postgres    false            �            1259    16429    lists    TABLE     �   CREATE TABLE public.lists (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying(256) NOT NULL,
    boardid uuid
);
    DROP TABLE public.lists;
       public         heap    postgres    false            �            1259    16402    users    TABLE     �   CREATE TABLE public.users (
    id uuid DEFAULT gen_random_uuid() NOT NULL,
    name character varying(256) NOT NULL,
    email character varying(256) NOT NULL
);
    DROP TABLE public.users;
       public         heap    postgres    false            <           2606    16418    board_users board_users_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.board_users
    ADD CONSTRAINT board_users_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.board_users DROP CONSTRAINT board_users_pkey;
       public            postgres    false    217            6           2606    16401    boards boards_pkey 
   CONSTRAINT     P   ALTER TABLE ONLY public.boards
    ADD CONSTRAINT boards_pkey PRIMARY KEY (id);
 <   ALTER TABLE ONLY public.boards DROP CONSTRAINT boards_pkey;
       public            postgres    false    215            @           2606    16477    cards cards_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.cards DROP CONSTRAINT cards_pkey;
       public            postgres    false    219            B           2606    16494    cards_users cards_users_pkey 
   CONSTRAINT     Z   ALTER TABLE ONLY public.cards_users
    ADD CONSTRAINT cards_users_pkey PRIMARY KEY (id);
 F   ALTER TABLE ONLY public.cards_users DROP CONSTRAINT cards_users_pkey;
       public            postgres    false    220            >           2606    16434    lists lists_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.lists
    ADD CONSTRAINT lists_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.lists DROP CONSTRAINT lists_pkey;
       public            postgres    false    218            8           2606    16411    users users_email_key 
   CONSTRAINT     Q   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);
 ?   ALTER TABLE ONLY public.users DROP CONSTRAINT users_email_key;
       public            postgres    false    216            :           2606    16409    users users_pkey 
   CONSTRAINT     N   ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);
 :   ALTER TABLE ONLY public.users DROP CONSTRAINT users_pkey;
       public            postgres    false    216            C           2606    16419 $   board_users board_users_boardid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.board_users
    ADD CONSTRAINT board_users_boardid_fkey FOREIGN KEY (boardid) REFERENCES public.boards(id) ON UPDATE CASCADE ON DELETE CASCADE;
 N   ALTER TABLE ONLY public.board_users DROP CONSTRAINT board_users_boardid_fkey;
       public          postgres    false    217    215    4662            D           2606    16424 #   board_users board_users_userid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.board_users
    ADD CONSTRAINT board_users_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.board_users DROP CONSTRAINT board_users_userid_fkey;
       public          postgres    false    216    4666    217            F           2606    16478    cards cards_list_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_list_id_fkey FOREIGN KEY (list_id) REFERENCES public.lists(id) ON UPDATE CASCADE ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.cards DROP CONSTRAINT cards_list_id_fkey;
       public          postgres    false    218    4670    219            G           2606    16495 #   cards_users cards_users_cardid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cards_users
    ADD CONSTRAINT cards_users_cardid_fkey FOREIGN KEY (cardid) REFERENCES public.cards(id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.cards_users DROP CONSTRAINT cards_users_cardid_fkey;
       public          postgres    false    220    219    4672            H           2606    16500 #   cards_users cards_users_userid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.cards_users
    ADD CONSTRAINT cards_users_userid_fkey FOREIGN KEY (userid) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;
 M   ALTER TABLE ONLY public.cards_users DROP CONSTRAINT cards_users_userid_fkey;
       public          postgres    false    216    4666    220            E           2606    16435    lists lists_boardid_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY public.lists
    ADD CONSTRAINT lists_boardid_fkey FOREIGN KEY (boardid) REFERENCES public.boards(id) ON UPDATE CASCADE ON DELETE CASCADE;
 B   ALTER TABLE ONLY public.lists DROP CONSTRAINT lists_boardid_fkey;
       public          postgres    false    215    218    4662           